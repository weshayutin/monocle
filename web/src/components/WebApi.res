// Copyright (C) 2021 Monocle authors
// SPDX-License-Identifier: AGPL-3.0-or-later

// Generated by monocle-codegen. DO NOT EDIT!

type axiosResponse<'data> = {data: 'data}
type axios<'data> = Js.Promise.t<axiosResponse<'data>>
let serverUrl = %raw(`
  (window.API_URL !== '__API_URL__' ? window.API_URL : process.env.REACT_APP_API_URL || '')
`)

module Config = {
  @module("axios")
  external getWorkspacesRaw: (string, 'a) => axios<'b> = "post"

  let getWorkspaces = (request: ConfigTypes.get_workspaces_request): axios<
    ConfigTypes.get_workspaces_response,
  > =>
    request->ConfigBs.encode_get_workspaces_request
    |> getWorkspacesRaw(serverUrl ++ "/api/2/get_workspaces")
    |> Js.Promise.then_(resp =>
      {data: resp.data->ConfigBs.decode_get_workspaces_response}->Js.Promise.resolve
    )
  @module("axios")
  external getProjectsRaw: (string, 'a) => axios<'b> = "post"

  let getProjects = (request: ConfigTypes.get_projects_request): axios<
    ConfigTypes.get_projects_response,
  > =>
    request->ConfigBs.encode_get_projects_request
    |> getProjectsRaw(serverUrl ++ "/api/1/get_projects")
    |> Js.Promise.then_(resp =>
      {data: resp.data->ConfigBs.decode_get_projects_response}->Js.Promise.resolve
    )
  @module("axios")
  external healthRaw: (string, 'a) => axios<'b> = "post"

  let health = (request: ConfigTypes.health_request): axios<ConfigTypes.health_response> =>
    request->ConfigBs.encode_health_request
    |> healthRaw(serverUrl ++ "/api/2/health")
    |> Js.Promise.then_(resp =>
      {data: resp.data->ConfigBs.decode_health_response}->Js.Promise.resolve
    )
}

module Search = {
  @module("axios")
  external suggestionsRaw: (string, 'a) => axios<'b> = "post"

  let suggestions = (request: SearchTypes.search_suggestions_request): axios<
    SearchTypes.search_suggestions_response,
  > =>
    request->SearchBs.encode_search_suggestions_request
    |> suggestionsRaw(serverUrl ++ "/api/1/suggestions")
    |> Js.Promise.then_(resp =>
      {data: resp.data->SearchBs.decode_search_suggestions_response}->Js.Promise.resolve
    )
  @module("axios")
  external fieldsRaw: (string, 'a) => axios<'b> = "post"

  let fields = (request: SearchTypes.fields_request): axios<SearchTypes.fields_response> =>
    request->SearchBs.encode_fields_request
    |> fieldsRaw(serverUrl ++ "/api/2/search/fields")
    |> Js.Promise.then_(resp =>
      {data: resp.data->SearchBs.decode_fields_response}->Js.Promise.resolve
    )
  @module("axios")
  external queryRaw: (string, 'a) => axios<'b> = "post"

  let query = (request: SearchTypes.query_request): axios<SearchTypes.query_response> =>
    request->SearchBs.encode_query_request
    |> queryRaw(serverUrl ++ "/api/2/search/query")
    |> Js.Promise.then_(resp =>
      {data: resp.data->SearchBs.decode_query_response}->Js.Promise.resolve
    )
}

module UserGroup = {
  @module("axios")
  external listRaw: (string, 'a) => axios<'b> = "post"

  let list = (request: UserGroupTypes.list_request): axios<UserGroupTypes.list_response> =>
    request->UserGroupBs.encode_list_request
    |> listRaw(serverUrl ++ "/api/2/user_group/list")
    |> Js.Promise.then_(resp =>
      {data: resp.data->UserGroupBs.decode_list_response}->Js.Promise.resolve
    )
  @module("axios")
  external getRaw: (string, 'a) => axios<'b> = "post"

  let get = (request: UserGroupTypes.get_request): axios<UserGroupTypes.get_response> =>
    request->UserGroupBs.encode_get_request
    |> getRaw(serverUrl ++ "/api/2/user_group/get")
    |> Js.Promise.then_(resp =>
      {data: resp.data->UserGroupBs.decode_get_response}->Js.Promise.resolve
    )
}

module TaskData = {
  @module("axios")
  external commitRaw: (string, 'a) => axios<'b> = "post"

  let commit = (request: TaskDataTypes.task_data_commit_request): axios<
    TaskDataTypes.task_data_commit_response,
  > =>
    request->TaskDataBs.encode_task_data_commit_request
    |> commitRaw(serverUrl ++ "/api/1/task_data_commit")
    |> Js.Promise.then_(resp =>
      {data: resp.data->TaskDataBs.decode_task_data_commit_response}->Js.Promise.resolve
    )
  @module("axios")
  external getLastUpdatedRaw: (string, 'a) => axios<'b> = "post"

  let getLastUpdated = (request: TaskDataTypes.task_data_get_last_updated_request): axios<
    TaskDataTypes.task_data_get_last_updated_response,
  > =>
    request->TaskDataBs.encode_task_data_get_last_updated_request
    |> getLastUpdatedRaw(serverUrl ++ "/api/1/task_data_get_last_updated")
    |> Js.Promise.then_(resp =>
      {data: resp.data->TaskDataBs.decode_task_data_get_last_updated_response}->Js.Promise.resolve
    )
  @module("axios")
  external addRaw: (string, 'a) => axios<'b> = "post"

  let add = (request: TaskDataTypes.add_request): axios<TaskDataTypes.add_response> =>
    request->TaskDataBs.encode_add_request
    |> addRaw(serverUrl ++ "/api/1/task_data_add")
    |> Js.Promise.then_(resp =>
      {data: resp.data->TaskDataBs.decode_add_response}->Js.Promise.resolve
    )
}

module Crawler = {

}
