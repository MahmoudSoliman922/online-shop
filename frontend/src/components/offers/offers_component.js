import React, { Component, Fragment } from 'react';
import { ThemeProvider, createGlobalStyle } from 'styled-components';
import Table from '../shared/Table';
import { getAllOffers, getPaginatedOffers, getFilteredOffers } from './offers_requests';
import { TableDiv, ExplainationDiv, HeaderDiv, Label, Click, Dot, Button, DotDiv, ButtonDiv, theme } from './offers_styles';
const GlobalStyles = createGlobalStyle`
  @import url("https://fonts.googleapis.com/css?family=Lobster&display=swap");
  @import url("https://fonts.googleapis.com/css?family=Saira&display=swap");
  body {
    font-family: 'Lobster', cursive;
  }
`;

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

  componentDidMount() {
    getAllOffers().then(res => {
      let departements = this.convertDepartements(res.data.response.offers);
      this.setState({
        ...this.state,
        departement: departements
      });
    });
  }

  switchToServerSidePagination = () => {
    theme.color = theme.color === 'grey' ? 'green' : 'grey';
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
      <Fragment>
        <GlobalStyles />
        {this.state.departement.length !== 0 && (
          <ThemeProvider theme={theme}>
            <HeaderDiv>
              <ButtonDiv>
                <Button
                  onClick={() => {
                    this.switchToServerSidePagination();
                  }}
                >
                  Switch
                </Button>
              </ButtonDiv>
              <DotDiv>
                <Dot />
              </DotDiv>
            </HeaderDiv>
            <TableDiv>
              <Table
                columns={columns}
                data={this.state.data}
                serverSide={this.state.serverSidePagination}
                getAll={getAllOffers}
                getPaginated={getPaginatedOffers}
                getFiltered={getFilteredOffers}
              />
            </TableDiv>
            <ExplainationDiv>
              <Label>You should</Label>
              <br />
              <Click>click</Click>
              <br />
              <Label>on the switch button to activate the server side pagination and filter</Label>
            </ExplainationDiv>
          </ThemeProvider>
        )}
      </Fragment>
    );
  }
}

export default OffersComponent;
