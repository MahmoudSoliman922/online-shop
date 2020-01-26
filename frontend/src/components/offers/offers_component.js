import React, { Component, Fragment } from 'react';
import styled, { ThemeProvider, createGlobalStyle } from 'styled-components';
import Table from '../shared/Table';
import { getAllOffers, getPaginatedOffers, getFilteredOffers } from './offers_requests';

const GlobalStyles = createGlobalStyle`
  @import url("https://fonts.googleapis.com/css?family=Lobster&display=swap");
  @import url("https://fonts.googleapis.com/css?family=Saira&display=swap");
  body {
    font-family: 'Lobster', cursive;
  }
`;
const theme = {
  padding: 0,
  margin: 0,
  display: 'flex',
  'flex-wrap': 'nowrap',
  color: 'grey'
};

const ButtonDiv = styled.div`
  width: 5%;
`;
const DotDiv = styled.div`
  width: 40%;
  padding-top: 5px;

`;

const Button = styled.button`
  font-family: sans-serif;
  font-size: 1rem;
  border: none;
  border-radius: 5px;
  padding: 7px;
  background: black;
  color: white;
  border-style: solid;
  border-width: 1px;
  border-color: green;
  &:hover {
    background: green;
  }
  &:click {

  }
`;

const Dot = styled.span`
  height: 10px;
  width: 10px;
  background-color: ${(props)=>props.theme.color};
  border-radius: 50%;
  display: inline-block;
`;

const Label = styled.label`
  font-size: 2rem;
  font-family: 'Saira', sans-serif;
`;

const Click = styled.label`
  font-size: 6rem;
  color: green;
`;

const HeaderDiv = styled.div`
  padding-top: 5px;
  width: 90%;
  display: flex;
  flex-wrap: nowrap;
`;

const ExplainationDiv = styled.div`
  width: 25%;
  padding-top: 15%;
  padding-left: 5%;
  padding-right: 5%;
  padding-bottom: 2%;
  background: black;
  color: white;
  text-align: center;
  font-size: 4rem;
`;

const TableDiv = styled.div`
  width: 55%;
  padding-top: 1%;
  padding-left: 2%;
  padding-right: 2%;
  padding-bottom: 2%;
  background: black;
  float: right;
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
    theme.color = theme.color === 'grey' ? 'green' : 'grey'
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
