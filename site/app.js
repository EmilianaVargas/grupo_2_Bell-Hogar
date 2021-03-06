var createError = require('http-errors');
var express = require('express');
var path = require('path');

var cookieParser = require('cookie-parser');
var logger = require('morgan');
const methodOverride = require('method-override');
let session = require('express-session');
let middRecordame = require('./middlewares/middRecordame');

var indexRouter = require('./routes/index');
var productsRouter = require('./routes/products');
var usersRouter = require('./routes/users');
var cartsRouter = require('./routes/carts');
const middProducts = require('./middlewares/middProducts');

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
app.use(methodOverride('_method'));
app.use(session({
  secret:'Bell-Hogar',
  resave: true,
  saveUninitialized: true
}));
app.use(middRecordame);
app.use-(middProducts);

app.use('/', indexRouter);
app.use('/products', productsRouter);
app.use('/users', usersRouter);
app.use('/carts', cartsRouter);


// catch 404 and forward to error handler
app.use(function(req, res, next) {
  res.render('error404')
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;