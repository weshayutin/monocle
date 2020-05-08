// Monocle.
// Copyright (C) 2019-2020 Monocle authors

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as published
// by the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.

// You should have received a copy of the GNU Affero General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

import React from 'react'

import Navbar from 'react-bootstrap/Navbar'
import Nav from 'react-bootstrap/Nav'
import NavDropdown from 'react-bootstrap/NavDropdown'
import { Link } from 'react-router-dom'
import PropTypes from 'prop-types'
import { CUserView } from './user'

const TITLE = (window.TITLE && window.TITLE !== '__TITLE__') ? window.TITLE : (process.env.REACT_APP_TITLE || 'Monocle')

class TopMenu extends React.Component {
  render () {
    const search = window.location.search
    document.title = this.props.index ? `${TITLE} / ${this.props.index}` : TITLE
    return <Navbar bg="light" expand="lg">
      <Navbar.Brand>
        <Link className="navbar-brand" to="/">{TITLE}</Link>
      </Navbar.Brand>
      {this.props.index
        ? <Nav className="mr-auto">
          <Link className="nav-link" to={`/${this.props.index}${search}`}>Top</Link>
          <Link className="nav-link" to={`/${this.props.index}/people${search}`}>People</Link>
          <NavDropdown title="Changes" id="changes-nav-dropdown">
            <Link className="nav-link" to={`/${this.props.index}/changes${search}`}>Summary</Link>
            <Link className="nav-link" to={`/${this.props.index}/opened-changes${search}`}>Opened</Link>
            <Link className="nav-link" to={`/${this.props.index}/merged-changes${search}`}>Merged</Link>
            <Link className="nav-link" to={`/${this.props.index}/abandoned-changes${search}`}>Abandoned</Link>
          </NavDropdown>
        </Nav> : null}
      <Nav className="ml-auto">
        <CUserView />
      </Nav>
      <Navbar.Toggle aria-controls="basic-navbar-nav" />
    </Navbar>
  }
}

TopMenu.propTypes = {
  index: PropTypes.string
}

export default TopMenu
