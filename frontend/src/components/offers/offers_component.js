import React, { Component } from 'react';
import Table from '../shared/Table';
import { getAllOffers, getPaginatedOffers, getFilteredOffers } from './offers_requests';

class OffersComponent extends Component {
  state = {
    departement: [],
    serverSidePagination: false
  };

  convertDepartements = offers => {
    return offers.map(offer => {
      return offer.departement_name;
    });
  };

  componentDidMount(){
    getAllOffers().then(res => {
      let departements = this.convertDepartements(res.data.response.offers)
      this.setState({
        ...this.state,
        departement: departements
      })
    })
  }

  switchToServerSidePagination = () => {
    this.setState({
      ...this.state,
      serverSidePagination: !this.state.serverSidePagination
    });
  };

  render() {
    let columns = [
      {
        name: 'departement_name',
        label: 'Departement Name',
        options: {
          filter: true,
          sort: true,
          searchable: false,
          filterOptions: { names: this.state.departement }
        }
      },
      {
        name: 'product_name',
        label: 'Product Name',
        options: {
          filter: false
        }
      },
      {
        name: 'product_price',
        label: 'Product Price',
        options: {
          filter: false,
          searchable: false
        }
      },
      {
        name: 'promotion_code',
        label: 'Promotion Code',
        options: {
          searchable: false,
          filter: false
        }
      },
      {
        name: 'promotion_active',
        label: 'Promotion Status',
        options: {
          filter: true,
          searchable: false,
          filterOptions: {
            names: [true, false]
          },
          customBodyRender: (value, tableMeta, updateValue) => {
            return <p>{value.toString()}</p>;
          }
        }
      },
      {
        name: 'promotion_discount',
        label: 'Promotion Discount',
        options: {
          filter: false,
          searchable: false
        }
      }
    ];
    return (
      <div className='content-wrapper' style={{ minHeight: '960.3px' }}>
          {
              this.state.departement.length !== 0 &&
              <div>
              TABLE SHOULD BE HERE!
              <button
                onClick={() => {
                  this.switchToServerSidePagination();
                }}
              >
                SWITCH TO SERVERSIDE
              </button>
              <Table
                columns={columns}
                data={this.state.data}
                serverSide={this.state.serverSidePagination}
                getAll={getAllOffers}
                getPaginated={getPaginatedOffers}
                getFiltered={getFilteredOffers}
              />
            </div>
          }
      </div>
    );
  }
}

export default OffersComponent;
