
"use strict";

let Fiducial = require('./Fiducial.js');
let MarkerWithCovarianceStamped = require('./MarkerWithCovarianceStamped.js');
let FiducialDetection = require('./FiducialDetection.js');
let MarkerDetection = require('./MarkerDetection.js');
let MarkerWithCovariance = require('./MarkerWithCovariance.js');
let MarkerStamped = require('./MarkerStamped.js');
let Marker = require('./Marker.js');
let MarkerWithCovarianceArray = require('./MarkerWithCovarianceArray.js');

module.exports = {
  Fiducial: Fiducial,
  MarkerWithCovarianceStamped: MarkerWithCovarianceStamped,
  FiducialDetection: FiducialDetection,
  MarkerDetection: MarkerDetection,
  MarkerWithCovariance: MarkerWithCovariance,
  MarkerStamped: MarkerStamped,
  Marker: Marker,
  MarkerWithCovarianceArray: MarkerWithCovarianceArray,
};
