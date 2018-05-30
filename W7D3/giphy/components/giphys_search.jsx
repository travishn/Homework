import React from 'react';
import GiphysIndex from './giphys_index';



class GiphysSearch extends React.Component {
  constructor(props) {
    super(props);
    this.state = { searchTerm: '' };

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(event) {
    event.preventDefault();
    this.setState({searchTerm: event.target.value});
  }

  // handleChange(argument) {
  //   return (event) => {
  //     this.setState({argument: event.target.value});
  //   };
  // }

  handleSubmit(event) {
    event.preventDefault();
    let searchTerm = this.state.searchTerm.split(' ').join('+');
    this.props.fetchSearchGiphys(searchTerm);
  }

  render() {
    const { giphys } = this.props;

    return (
      <div>
        <input value={this.state.searchTerm} onChange={this.handleChange}/>
         <button type="submit" onClick={this.handleSubmit}>Search Giphy</button>
         <GiphysIndex giphys={giphys}/>
      </div>
    );
  }
}

export default GiphysSearch;
