class BackendEndPoints {

  static const baseUrl = 'https://api.themoviedb.org/3/';  
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static  String imageUrl(String path) => '$baseImageUrl$path';

  static const apiKey = '13ba99a95b3cfedd4ed6258f88c68431';
  static const token = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxM2JhOTlhOTViM2NmZWRkNGVkNjI1OGY4OGM2ODQzMSIsIm5iZiI6MTc0ODAyMTE0My42NTY5OTk4LCJzdWIiOiI2ODMwYWY5N2Q1MmQ0OGU0NDEyYjY1MDkiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.52dbnvsUBz3PWVPdzOHzP0T-oZNSDQg9E6J_HfHdhI4';

}

const splash = '/';
const onBoarding = 'onbording';
const login = 'login';
const singUp = 'singup';
const homeView = 'homeView';
const termAndCond = 'termAndCond';
const recipesView = 'recipesView';

const isOnBoardSeen = 'isOnBoardingSeen';
const kUserData = 'kUserData';
