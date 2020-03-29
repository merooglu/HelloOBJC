var express = require('express');
var bodyParser = require('body-parser');
var app = express();

app.all('/*', function(req, res, next){
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "X-Requested-With","Content-Type, Accept");
  res.header("Access-Control-Allow-Methods", "POST, GET");
  next();
});

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));

var tutorials = [
  {
    id: 1,
    title: "Android Course",
    description: "Learn how to build android apps Learn how to build android apps Learn how to build android appsLearn how to build android apps",
    thumbnail: "https://homepages.cae.wisc.edu/~ece533/images/arctichare.png",
    iframe: '<div class="container"><iframe class="video" src="https://www.youtube.com/embed/8PjiSM4ZI-8" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></div>'
  },
  {
    id: 2,
    title: "İOS Course",
    description: "Learn how to build ios appsLearn how to build ios appsLearn how to build ios apps Learn how to build ios apps Learn how to build ios apps Learn how to build ios apps",
    thumbnail: "https://homepages.cae.wisc.edu/~ece533/images/girl.png",
    iframe: '<div class="container"><iframe class="video" src="https://www.youtube.com/embed/whd1rqEKXzM" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></div>'
  },
  {
    id: 3,
    title: "Javascript Course ",
    description: "Learn how to build Javascript appsJavascript Course Javascript Course Javascript Course Javascript Course Javascript Course Javascript Course",
    thumbnail: "https://homepages.cae.wisc.edu/~ece533/images/cat.png",
    iframe: '<div class="container"><iframe class="video" src="https://www.youtube.com/embed/e_TxH59MclA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></div>'
  },
  {
    id: 4,
    title: "Python Course",
    description: "Learn how to build Python apps Learn how to build Python apps Learn how to build Python apps Learn how to build Python apps Learn how to build Python apps",
    thumbnail: "https://homepages.cae.wisc.edu/~ece533/images/fruits.png",
    iframe: '<div class="container"><iframe class="video" src="https://www.youtube.com/embed/u3Z_ve65Lfo" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></div>'
  }
];

var comments = [
  {
    username: "jack",
    comment: "This app is really cool you should improve this app to improve your development skills"
  }
];

app.post('/comments', function(req, res){
  var comment = req.body;
  if (comment) {
    if (comment.username && comment.comment) {
      comments.push(comment)
    } else {
      res.send("You posted invalid data");
    }
  } else {
    res.send("Your post has no body!");
  }

  console.log(comments);
  res.send("You successfully posted a comment");
});

app.put('/comments', function(req, res){
  var someOBJ = req.body;
  var theId = someOBJ.uniqueId;

  // talk to database, find the record by the id
  //then your replace theexisting record with req.bodyParser
  res.send("successfully update");
});

app.get('/tutorials', function(req, res){
  console.log("GET from server");
  res.send(tutorials);
});

app.listen(6069);
