// Copyright (C) 2021 Monocle authors
// SPDX-License-Identifier: AGPL-3.0-or-later
//
// The change component
//

open Prelude
open MLink

let getDate = (ts: option<TimestampTypes.timestamp>): Js.Date.t =>
  ts->Belt.Option.getExn->Belt.Option.getExn

let complexicity = (change: SearchTypes.change) =>
  Int32.to_int(change.changed_files_count) +
  Int32.to_int(change.additions) +
  Int32.to_int(change.deletions)

module TaskData = {
  type t = TaskDataTypes.task_data

  module TaskType = {
    @react.component
    let make = (~ttype: string) => <Patternfly.Label> {ttype->str} </Patternfly.Label>
  }

  module TaskPS = {
    let getLabelColor = (level: string) =>
      switch level {
      | "urgent" => #Purple
      | "high" => #Red
      | "medium" => #Orange
      | "low" => #Green
      | _ => #Green
      }
    @react.component
    let make = (~ps, ~name) => {
      let label = name ++ ": " ++ ps
      <Patternfly.Label color={ps->getLabelColor}> {label} </Patternfly.Label>
    }
  }

  module TaskScore = {
    @react.component
    let make = (~score) => {
      let label = "Score: " ++ string_of_int(Int32.to_int(score))
      <Patternfly.Label> {label} </Patternfly.Label>
    }
  }

  module TaskLink = {
    @react.component
    let make = (~td: TaskDataTypes.task_data) =>
      switch td.url {
      | url if Js.String.indexOf("show_bug.cgi", url) >= 0 =>
        <a href=url> <Patternfly.Icons.ExternalLinkAlt /> {(" rhbz#" ++ td.tid)->str} </a>
      | url => <a href=url> {url->str} </a>
      }
  }

  @react.component
  let make = (~td: t) => {
    <>
      {"Task: "->str}
      <TaskLink td />
      <TaskPS ps=td.priority name="Priority" />
      <TaskPS ps=td.severity name="Severity" />
      <TaskScore score=td.score />
      <Patternfly.LabelGroup categoryName="Type">
        {td.ttype->Belt.List.map(x => <TaskType ttype={x} />)->Belt.List.toArray->React.array}
      </Patternfly.LabelGroup>
    </>
  }
}

module Approvals = {
  module Label = {
    @react.component
    let make = (~approval: string) => {
      let regex = %re("/.*-.$/")
      let color = switch approval {
      | "CHANGES_REQUESTED"
      | "REVIEW_REQUIRED" =>
        #Orange
      | _ if regex->Js.Re.test_(approval) => #Red
      | _ if Js.String.includes("+0", approval) => #Grey
      | _ => #Green
      }
      <Patternfly.Label color> {approval} </Patternfly.Label>
    }
  }
  @react.component
  let make = (~approvals: list<string>, ~withGroup: bool) => {
    let labels =
      approvals
      ->Belt.List.mapWithIndex((idx, approval) => <Label key={string_of_int(idx)} approval />)
      ->Belt.List.toArray
      ->React.array
    withGroup
      ? <Patternfly.LabelGroup categoryName={"Approvals"} numLabels={5}>
          {labels}
        </Patternfly.LabelGroup>
      : {labels}
  }
}

module Mergeable = {
  @react.component
  let make = (~state: string, ~mergeable: bool) =>
    switch state {
    | "MERGED" => React.null
    | "CLOSED" => React.null
    | _ =>
      mergeable
        ? React.null
        : <Patternfly.Label color=#Orange> {"Conflicting"->str} </Patternfly.Label>
    }
}

module FilterLink = {
  @react.component
  let make = (~store: Store.t, ~queryField: string, ~queryValue: string, ~name: string) => {
    let (state, _) = store
    let newFilter = queryField ++ ":\"" ++ queryValue ++ "\""
    let filter = Js.String.includes(newFilter, state.filter)
      ? state.filter
      : addQuery(state.filter, newFilter)
    let path = "changes"
    <MonoLink store filter path name />
  }
}

module ProjectLink = {
  @react.component
  let make = (~store, ~project) => {
    <span style={horizontalSpacing}>
      <FilterLink store queryField="repo" queryValue={project} name=project />
    </span>
  }
}

module BranchLink = {
  @react.component
  let make = (~store, ~branch) => {
    <span style={horizontalSpacing}>
      <FilterLink store queryField="branch" queryValue={branch} name=branch />
    </span>
  }
}

module ChangeLink = {
  @react.component
  let make = (~store: Store.t, ~id, ~title) => {
    let (state, _) = store
    <MLink.Direct link={"/" ++ state.index ++ "/change/" ++ id} name={title} />
  }
}

module AuthorLink = {
  @react.component
  let make = (~store: Store.t, ~title, ~author) => {
    <> {title->str} <FilterLink store queryField="author" queryValue={author} name={author} /> </>
  }
}

module RelativeDate = {
  @react.component
  let make = (~title, ~date) => {
    let dateStr = date->momentFromNow
    <> {title->str} {dateStr->str} </>
  }
}

module State = {
  @react.component
  let make = (~state, ~draft) => {
    let (color, value) = draft
      ? (#Grey, "Draft")
      : switch state {
        | "OPEN" => (#Green, "Open")
        | "MERGED" => (#Blue, "Merged")
        | "CLOSED" => (#Purple, "Abandoned")
        | _ => (#Red, state)
        }
    <Label color> {value->str} </Label>
  }
}

let oneLineStyle = ReactDOM.Style.make(
  ~overflow="hidden",
  ~textOverflow="ellipsis",
  ~whiteSpace="nowrap",
  (),
)

module DataItem = {
  @react.component
  let make = (~store: Store.t, ~change: SearchTypes.change) =>
    <DataListItemRow key={change.url}>
      <DataListCell>
        <Card isCompact={true}>
          <CardHeader>
            <State state={change.state} draft={change.draft} />
            <Mergeable state={change.state} mergeable={change.mergeable} />
            <ExternalLink href={change.url} />
            <ProjectLink store project={change.repository_fullname} />
            {"<"->str}
            <BranchLink store branch={change.target_branch} />
            {">"->str}
            <span style={ReactDOM.Style.make(~textAlign="right", ~width="100%", ())}>
              {"Complexicity: "->str}
              <Badge isRead={true}> {change->complexicity->string_of_int->str} </Badge>
            </span>
          </CardHeader>
          <CardBody>
            <div style={oneLineStyle}>
              {"Title: "->str} <ChangeLink store id={change.change_id} title={change.title} />
            </div>
            <div style={oneLineStyle}>
              <RelativeDate title="Created " date={change.created_at->getDate} />
              <AuthorLink store title=" by " author={change.author} />
              <RelativeDate title=", updated " date={change.updated_at->getDate} />
            </div>
            <Approvals withGroup={true} approvals={change.approval} />
            {switch change.task_data {
            | list{} => React.null
            | xs =>
              <MStack>
                {xs
                ->Belt.List.map(td => <MStackItem> <TaskData td /> </MStackItem>)
                ->Belt.List.toArray
                ->React.array}
              </MStack>
            }}
          </CardBody>
        </Card>
      </DataListCell>
    </DataListItemRow>
}

module RowItem = {
  module Head = {
    @react.component
    let make = () =>
      <thead>
        <tr role="row">
          <th role="columnheader"> {"Title"->str} </th>
          <th role="columnheader"> {"Status"->str} </th>
          <th role="columnheader"> {"Owner"->str} </th>
          <th role="columnheader"> {"Repo"->str} </th>
          <th role="columnheader"> {"Branch"->str} </th>
          <th role="columnheader"> {"Created"->str} </th>
          <th role="columnheader"> {"Updated"->str} </th>
          <th role="columnheader"> {"Size"->str} </th>
          <th role="columnheader"> {"Approvals"->str} </th>
        </tr>
      </thead>
  }
  @react.component
  let make = (~store: Store.t, ~change: SearchTypes.change) =>
    <tr role="row">
      <td role="cell">
        <ExternalLink href={change.url} />
        <ChangeLink store id={change.change_id} title={change.title} />
      </td>
      <td role="cell">
        <div style={oneLineStyle}>
          <State state={change.state} draft={change.draft} />
          <Mergeable state={change.state} mergeable={change.mergeable} />
        </div>
      </td>
      <td role="cell"> <AuthorLink store title="" author={change.author} /> </td>
      <td role="cell"> <ProjectLink store project={change.repository_fullname} /> </td>
      <td role="cell"> <BranchLink store branch={change.target_branch} /> </td>
      <td role="cell"> <RelativeDate title="" date={change.created_at->getDate} /> </td>
      <td role="cell"> <RelativeDate title="" date={change.updated_at->getDate} /> </td>
      <td role="cell">
        <Badge isRead={true}> {change->complexicity->string_of_int->str} </Badge>
      </td>
      <td role="cell"> <Approvals withGroup={false} approvals={change.approval} /> </td>
    </tr>
}

module Table = {
  @react.component
  let make = (~store: Store.t, ~changes: list<SearchTypes.change>) => {
    let (changesArray, paginate) = changes->Belt.List.toArray->usePagination
    <>
      {paginate}
      <table className="pf-c-table pf-m-compact pf-m-grid-md" role="grid">
        <RowItem.Head />
        <tbody role="rowgroup">
          {changesArray
          ->Belt.Array.mapWithIndex((idx, change) =>
            <RowItem key={string_of_int(idx)} store change />
          )
          ->React.array}
        </tbody>
      </table>
    </>
  }
}
