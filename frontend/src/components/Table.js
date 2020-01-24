import React, { Component } from 'react';
import PropTypes from 'prop-types';
import MUIDataTable from "mui-datatables";

const columns = ["Name", "Title", "Location", "Age", "Salary"];

const data = [
  ['Gabby George', 'Business Analyst', 'Minneapolis', 30, '$100,000'],
  ['Aiden Lloyd', 'Business Consultant', 'Dallas', 55, '$200,000'],
  ['Jaden Collins', 'Attorney', 'Santa Ana', 27, '$500,000'],
  ['Franky Rees', 'Business Analyst', 'St. Petersburg', 22, '$50,000'],
  ['Aaren Rose', 'Business Consultant', 'Toledo', 28, '$75,000'],
  ['Blake Duncan', 'Business Management Analyst', 'San Diego', 65, '$94,000'],
  ['Frankie Parry', 'Agency Legal Counsel', 'Jacksonville', 71, '$210,000'],
  ['Lane Wilson', 'Commercial Specialist', 'Omaha', 19, '$65,000'],
  ['Robin Duncan', 'Business Analyst', 'Los Angeles', 20, '$77,000'],
  ['Mel Brooks', 'Business Consultant', 'Oklahoma City', 37, '$135,000'],
  ['Harper White', 'Attorney', 'Pittsburgh', 52, '$420,000'],
  ['Kris Humphrey', 'Agency Legal Counsel', 'Laredo', 30, '$150,000'],
  ['Frankie Long', 'Industrial Analyst', 'Austin', 31, '$170,000'],
  ['Brynn Robbins', 'Business Analyst', 'Norfolk', 22, '$90,000'],
  ['Justice Mann', 'Business Consultant', 'Chicago', 24, '$133,000'],
  ['Addison Navarro', 'Business Management Analyst', 'New York', 50, '$295,000'],
  ['Jesse Welch', 'Agency Legal Counsel', 'Seattle', 28, '$200,000'],
  ['Eli Mejia', 'Commercial Specialist', 'Long Beach', 65, '$400,000'],
  ['Gene Leblanc', 'Industrial Analyst', 'Hartford', 34, '$110,000'],
  ['Danny Leon', 'Computer Scientist', 'Newark', 60, '$220,000'],
  ['Lane Lee', 'Corporate Counselor', 'Cincinnati', 52, '$180,000'],
  ['Jesse Hall', 'Business Analyst', 'Baltimore', 44, '$99,000'],
  ['Danni Hudson', 'Agency Legal Counsel', 'Tampa', 37, '$90,000'],
  ['Terry Macdonald', 'Commercial Specialist', 'Miami', 39, '$140,000'],
  ['Justice Mccarthy', 'Attorney', 'Tucson', 26, '$330,000'],
  ['Silver Carey', 'Computer Scientist', 'Memphis', 47, '$250,000'],
  ['Franky Miles', 'Industrial Analyst', 'Buffalo', 49, '$190,000'],
  ['Glen Nixon', 'Corporate Counselor', 'Arlington', 44, '$80,000'],
  ['Gabby Strickland', 'Business Process Consultant', 'Scottsdale', 26, '$45,000'],
  ['Mason Ray', 'Computer Scientist', 'San Francisco', null, '$142,000']
];
const options = {
  filterType: 'dropdown',
  responsive: 'scroll'
};
class Table extends Component {
  // state = {
  //     data: [],
  //     filterd: {
  //         data: [],
  //         ids: []
  //     },
  //     keyword: undefined
  // };
  componentDidMount() {
    // this.setState({
    //     data: this.props.data
    // });
  }
  componentDidUpdate() {
    // if (this.props.data !== undefined && this.props.data !== this.state.data) {
    //     this.setState({
    //         data: this.props.data
    //     });
    // }
  }

  // handleChange = e => {
  //     let columnAccessors = [];
  //     this.props.columns.forEach(accessor => {
  //         accessor.accessor !== undefined && accessor.accessor !== 'disabled' && accessor.accessor !== 'id' ? columnAccessors.push(accessor.accessor) : '';
  //     });
  //     this.setState({
  //         filterd: {
  //             data: matchSorter(this.state.data, e.target.value, {
  //                 keys: columnAccessors
  //             })
  //         },
  //         keyword: e.target.value
  //     });
  // };

  // handlePagination = e => {
  //     if (e.target.name === 'next') {
  //         this.props.paginationHandler(this.props.page + 1);
  //     } else if (e.target.name === 'pre') {
  //         this.props.paginationHandler(this.props.page - 1);
  //     }
  // };

  render() {
    return <MUIDataTable title={'ACME Employee list'} data={data} columns={columns} options={options} />;
  }
}

// RTable.propTypes = {
//     paginationHandler: PropTypes.func,
//     className: PropTypes.string,
//     data: PropTypes.array,
//     columns: PropTypes.array,
//     columnsTypes: PropTypes.object,
//     onClickAction: PropTypes.func,
//     permission: PropTypes.string,
//     search: PropTypes.string,
//     page: PropTypes.number,
//     totalPages: PropTypes.number,
//     manual: PropTypes.bool
// };

export default Table;
