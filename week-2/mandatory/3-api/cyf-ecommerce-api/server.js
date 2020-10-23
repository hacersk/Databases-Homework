const express = require("express");
const app = express();


const { Pool } = require('pg');

const bodyParser = require("body-parser");
app.use(bodyParser.json());

const pool = new Pool({
    user: 'postgres',
    password: 'postgres',
    host: 'localhost',
    database: 'cyf_ecommerce',
    port: 5432
});

app.get("/products/suppliers",function(req, res) {

    pool.query("SELECT * FROM products inner join suppliers on products.supplier_id=suppliers.id;", (error, result) => {
        console.log(result.rows);
        res.json(result.rows);
    });
});
app.get("/products/:id", function (req, res) {
    const id = req.params.id;
  
    pool
      .query("SELECT * FROM products WHERE id=$1", [id])
      .then((result) => res.json(result.rows))
      .catch((e) => console.error(e));
  })

app.get("/products", function (req, res) {
    const name = req.query.name;

   let query = `SELECT * FROM products`;
  
    if (name) {
        console.log(name);
      query = `SELECT * FROM products WHERE LOWER(product_name) LIKE '%${name}%' `;
    }
  
    pool
      .query(query)
      .then((result) => res.json(result.rows))
     
      .catch((e) => console.error(e));
  });

 
app.get("/customers",function(req, res) {
    pool.query(`SELECT * FROM customers;`, (error, result) => {
        console.log(result.rows);
        res.json(result.rows);
    });
});

app.get("/suppliers",function(req, res) {
    pool.query('SELECT * FROM suppliers;', (error, result) => {
        console.log(result.rows);
        res.json(result.rows);
    });
});


app.listen(3001, function() {
    console.log("Server is listening on port 3000. Ready to accept requests!");
});
