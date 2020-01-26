import React from 'react';
import { CircularProgress, Typography } from '@material-ui/core';
import MUIDataTable from 'mui-datatables';

export default class Table extends React.Component {
  state = {
    page: 0,
    count: 0,
    data: [],
    isLoading: false,
    columns: [],
    filter: false,
    serverSideFilterList: [],
    serverSide: false,
    options: {}
  };

  componentDidMount() {
    this.props.getAll().then(offers => {
      this.setState({
        ...this.state,
        columns: this.props.columns,
        data: offers.data.response.offers,
        serverSide: this.props.serverSide,
        options: {
          filterType: 'dropdown',
          rowsPerPage: 15,
          responsive: 'stacked',
          count: offers.data.response.total,
          search: true,
          filter: true,
          serverSide: false,
          viewColumns: false,
          print: false,
          download: false
        }
      });
    });
  }

  componentDidUpdate() {
    if (this.props.serverSide !== this.state.serverSide) {
      if (this.props.serverSide === true) {
        this.setState({
          isLoading: true,
          serverSide: this.props.serverSide
        });
        this.props.getPaginated(1).then(res => {
          this.setState({
            isLoading: false,
            page: res.data.response.page,
            data: res.data.response.offers,
            serverSide: this.props.serverSide,
            columns: this.props.columns,
            count: res.data.response.total,
            options: {
              filterType: 'dropdown',
              responsive: 'stacked',
              count: res.data.response.total,
              search: false,
              viewColumns: false,
              filter: true,
              serverSide: true,
              print: false,
              download: false,
              onFilterChange: (column, filterList, type) => {
                if (type === 'chip') {
                  console.log('updating filters via chip');
                  this.handleFilterSubmit(filterList)();
                }
              },
              customFilterDialogFooter: filterList => {
                return (
                  <div style={{ marginTop: '40px' }}>
                    <button variant='contained' onClick={this.handleFilterSubmit(filterList)}>
                      Apply Filters*
                    </button>
                  </div>
                );
              },
              onTableChange: (action, tableState) => {
                switch (action) {
                  case 'changePage':
                    this.changePage(tableState.page);
                    break;
                }
              }
            }
          });
        });
      } else {
        this.props.getAll().then(offers => {
          this.setState({
            ...this.state,
            columns: this.props.columns,
            data: offers.data.response.offers,
            serverSide: this.props.serverSide,
            options: {
              filterType: 'dropdown',
              rowsPerPage: 15,
              responsive: 'stacked',
              count: offers.data.response.total,
              search: true,
              filter: true,
              serverSide: false,
              download: false,
              onFilterChange: (column, filterList, type) => {},
              customFilterDialogFooter: filterList => {},
              onTableChange: (action, tableState) => {}
            }
          });
        });
      }
    }
  }

  handleFilterSubmit = filterList => () => {
    console.log('Submitting filters: ', filterList);

    // this.setState({ isLoading: true, filters: filterList });

    // console.log(this.props);
    // this.props.getFiltered(filterList).then(res => {
    //   this.setState({
    //     isLoading: false,
    //     data: res.data.response.offers,
    //     serverSideFilterList: filterList,
    //     columns: this.props.columns,
    //     count: res.data.response.total
    //   });
    // });
  };

  changePage = page => {
    this.setState({
      isLoading: true
    });
    this.props.getPaginated(page + 1).then(res => {
      this.setState({
        isLoading: false,
        page: page,
        data: res.data.response.offers,
        count: res.data.response.total,
        columns: this.props.columns
      });
    });
  };

  render() {
    return (
      <div>
        <MUIDataTable
          title={
            <Typography variant='h3'>
              {/* {this.props.tableTitle} */}
              {this.state.isLoading && <CircularProgress size={24} style={{ marginLeft: 15, position: 'relative', top: 4 }} />}
            </Typography>
          }
          data={this.state.data}
          columns={this.state.columns}
          options={this.state.options}
        />
      </div>
    );
  }
}
