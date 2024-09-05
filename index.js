import express from "express";
import bodyParser from "body-parser";
import pg from "pg";

const app = express();
const port = 3000;

const db = new pg.Client({
  user: 'postgres',
  host: 'localhost',
  database: 'permalist',
  password: 'gur192001',
  port: 5432
}
);
db.connect();

app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static("public"));

let items = [];

app.get("/", async (req, res) => {
  await getItems();
  res.render("index.ejs", {
    listTitle: "Today",
    listItems: items,
  });
});

app.post("/add", async (req, res) => {
  const item = req.body.newItem;
  if (item){
    items.push({ title: item });
    try{
      const result = await db.query("INSERT INTO items (title) VALUES ($1)", [item]);
    } catch (err) {
      console.log(err);
    }
  } else
    console.log("No item specified. Empty item has not been added.");
  res.redirect("/");
});

app.post("/edit", async (req, res) => {
  if(req.body.updatedItemTitle !== '') {
    await db.query("UPDATE items SET title = $1 WHERE id = $2", [req.body.updatedItemTitle, req.body.updatedItemId]);
  } else
    console.log("No item specified. Empty item has not been updated.")
  res.redirect('/');
});

app.post("/delete", async (req, res) => {
  await db.query("DELETE FROM items WHERE id = $1", [req.body.deleteItemId]);
  res.redirect('/');
});

app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});


/* ##### AUXILIARY FUNCTIONS ##### */

async function getItems() {
  const result = await db.query("SELECT * FROM items ORDER BY id ASC");
  if (result)
    items = [];
    result.rows.forEach(item => items.push(item));
}