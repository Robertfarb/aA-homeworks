import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root';
import configureStore from './store/store';
import fetchSearchGiphys from './util/api_util';
import { receiveSearchGiphys } from './actions/giphy_actions';
import rootReducer from './reducers/root_reducer';

const store = configureStore();

document.addEventListener("DOMContentLoaded", () => {
  console.log("loaded!")
  window.store = store;
  window.fetchSearchGiphys = fetchSearchGiphys;
  window.receiveSearchGiphys = receiveSearchGiphys;
});

