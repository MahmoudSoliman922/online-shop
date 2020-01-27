import styled from 'styled-components';


export const theme = {
  padding: 0,
  margin: 0,
  display: 'flex',
  'flex-wrap': 'nowrap',
  color: 'grey'
};

export const ButtonDiv = styled.div`
  width: 5%;
`;
export const DotDiv = styled.div`
  width: 40%;
  padding-top: 5px;
`;

export const Button = styled.button`
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

export const Dot = styled.span`
  height: 10px;
  width: 10px;
  background-color: ${props => props.theme.color};
  border-radius: 50%;
  display: inline-block;
`;

export const Label = styled.label`
  font-size: 2rem;
  font-family: 'Saira', sans-serif;
`;

export const Click = styled.label`
  font-size: 6rem;
  color: green;
`;

export const HeaderDiv = styled.div`
  padding-top: 5px;
  width: 90%;
  display: flex;
  flex-wrap: nowrap;
`;

export const ExplainationDiv = styled.div`
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

export const TableDiv = styled.div`
  width: 55%;
  padding-top: 1%;
  padding-left: 2%;
  padding-right: 2%;
  padding-bottom: 2%;
  background: black;
  float: right;
`;
