const SWITCH_LOCATION = "SWITCH_LOCATION";

const selectLocation = (city, jobs) => ({
  type: SWITCH_LOCATION,
  city,
  jobs
});

export default selectLocation; //not sure why this export version doesn't work for window assignment
// not sure when you write export const selectLocation, the whole app doesn't work???
