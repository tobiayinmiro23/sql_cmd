// my sql constraints
  // 1. not null: makes sure the column cannot have null or empty values
  // 2. unique: ensures all values in the column are unique (different)
  // 3. check: ensures the value of a column matches a given condition eg check(gender = 'male' or 'female')
  // 4. default: it is used to specify a default value for a particular column where we have not specified any value eg country string default 'nigeria' '
  // 5. primary key: it is used to uniquely identify each  record in a table
  // 6.auto_increment: it automatically increments the next value
  // 7. enum: it is used to limit the value chosen to a list of permitted values in the column specification at time of creation eg size enum('small','medium','large','x-large')
  // 8. foreign key: it is also known as referencing key ,a foreign key column matches the primary key column of another table that is a foreign key refers to the primary key field of another table eg foreigh key(users_id) references products(product_id)

  // constraint to link the product table foreign key (laptop_id) with the laptop table primary key (id) Note : the type in foreign and primary key must be the same
  // create table product(
  //   id serial,
  //   laptop_id bigint reference laptop(id) 
  //   unique(laptop_id)
  // )

    // comand prompt code to run the queries in an sql file 
    // \i /path/data.sql

    // comand prompt code to expand the terminal 
    // \x

    // comand prompt code to list functions
    // \df

    // comand prompt code to list help
    // \?

    // comand prompt code to list help
    // \copy (select * from index) to 'path/product.csv' delimiter '.' csv header
// sql to all rows
 app.get('/products', async(req,res)=>{
  try{
    const data=await db.query('select * from index')
    res.json(data.rows)
  }
  catch (err){
    console.log(err)
    console.log('an error occured')
  }  
 })
// sql to fetch first five rows fetch is the sql standard
 app.get('/firstFiveProducts', async(req,res)=>{
  try{
    const data=await db.query('select * from index fetch first 5 rows only')
    res.json(data.rows)
  }
  catch (err){
    console.log(err)
    console.log('an error occured')
  }  
 })
// sql to fetch first all the rows after the five rows
 app.get('/offsetProducts', async(req,res)=>{
  try{
    const data=await db.query('select * from index offset 5 ')
    res.json(data.rows)
  }
  catch (err){
    console.log(err)
    console.log('an error occured')
  }  
 })
// sql to fetch first five rows
 app.get('/limitProducts', async(req,res)=>{
  try{
    const data=await db.query('select * from index limit 5')
    res.json(data.rows)
  }
  catch (err){
    console.log(err)
    console.log('an error occured')
  }  
 })

// sql to order all products by default in ascending order
 app.get('/orderProducts', async(req,res)=>{
  try{
    const data=await db.query('select * from index order by productname')
    res.json(data.rows)
  }
  catch (err){
    console.log(err)
    console.log('an error occured')
  }  
 })

// sql to order all products in descending order
 app.get('/orderByDescProducts', async(req,res)=>{
  try{
    const data=await db.query('select * from index order by productname desc')
    res.json(data.rows)
  }
  catch (err){
    console.log(err)
    console.log('an error occured')
  }  
 })

// sql to select the different processor names each processor name is selected ones ,no duplicate processor name is allowed
 app.get('/DistinctProducts', async(req,res)=>{
  try{
    const data=await db.query('select distinct processorname from index order by processorname ')
    res.json(data.rows)
  }
  catch (err){
    console.log(err)
    console.log('an error occured')
  }  
 })

// sql to select all rows where the productname matches a certain value (mac book pro) 
app.get('/selectWherProducts', async(req,res)=>{
  try{
        const data=await db.query("select * from index where productname = 'mac book pro' ")
    res.json(data.rows)
  }
  catch (err){
    console.log(err)
    console.log('an error occured')
  }  
 })

// sql to select all rows where the id contains certain values  
app.get('/selectWherInProducts', async(req,res)=>{
  try{
    const data=await db.query("select * from index where id in ('c1','c2','c3') ")
    res.json(data.rows)
  }
  catch (err){
    console.log(err)
    console.log('an error occured')
  }  
 })

// sql to select all rows where the no is between certain values  
app.get('/selectWherBetweenProducts', async(req,res)=>{
  try{
    // const data=await db.query("select * from index where no between 1 and 30 ")
    res.json(data.rows)
  }
  catch (err){
    console.log(err)
    console.log('an error occured')
  }  
 })

// sql to select all rows where the product name fits a certain pattern (product name ends with laptop) note: the like pattern is case sensitive 
app.get('/selectWherLikeProducts', async(req,res)=>{
  try{
    const data=await db.query("select * from index where productname like '%laptop' ")
    res.json(data.rows)
  }
  catch (err){
    console.log(err)
    console.log('an error occured')
  }  
 })

// sql to select all rows where the product name fits a certain pattern (product name ends with laptop) note: the ilike pattern is case insensitive 
app.get('/selectWherLikeProducts2', async(req,res)=>{
  try{
    const data=await db.query("select * from index where productname ilike '%Laptop' ")

    res.json(data.rows)
  }
  catch (err){
    console.log(err)
    console.log('an error occured')
  }  
 })

// sql to select the  brand from the database and total number for each brand
app.get('/selectGroupByProducts', async(req,res)=>{
  try{
    const data=await db.query("select brand, count(*) from index group by brand order by brand")
    res.json(data.rows)
  }
  catch (err){
    console.log(err)
    console.log('an error occured')
  }  
 })

// sql to select the all  brands from the database where the total number for a brand is greater than 3
app.get('/selectGroupByHavingProducts', async(req,res)=>{
  try{
    const data=await db.query("select brand, count(*) from index group by brand having count(*) > 3 order by brand")
    res.json(data.rows)
  }
  catch (err){
    console.log(err)
    console.log('an error occured')
  }  
 })

// sql to select the maximum number from the productprice column
app.get('/selectMaxProducts', async(req,res)=>{
  try{
    const data=await db.query("select max(productprice) from index")
    res.json(data.rows)
  }
  catch (err){
    console.log(err)
    console.log('an error occured')
  }  
 })

// sql to select the minimum number from the productprice column
app.get('/selectMinProducts', async(req,res)=>{
  try{
    const data=await db.query("select min(productprice) from index")
    res.json(data.rows)
  }
  catch (err){
    console.log(err)
    console.log('an error occured')
  }  
 })

 // sql to select the average number from the no column
app.get('/selectAvgProducts', async(req,res)=>{
  try{
    const data=await db.query("select avg(no) from index")
    res.json(data.rows)
  }
  catch (err){
    console.log(err)
    console.log('an error occured')
  }  
 })

 // sql to select the average number from the no column and round it up
app.get('/selectRoundProducts', async(req,res)=>{
  try{
    const data=await db.query("select round(avg(no)) from index")
    res.json(data.rows)
  }
  catch (err){
    console.log(err)
    console.log('an error occured')
  }  
 })

 // sql to select the sum of all the no column value
app.get('/selectSumProducts', async(req,res)=>{
  try{
    const data=await db.query("select sum(no) from index")
    res.json(data.rows)
  }
  catch (err){
    console.log(err)
    console.log('an error occured')
  }  
 })

// sql to select the sum of all the no column value with the name total
app.get('/selectSumAsProducts', async(req,res)=>{
  try{
    const data=await db.query("select sum(no) as total from index")
    res.json(data.rows)
  }
  catch (err){
    console.log(err)
    console.log('an error occured')
  }  
 })

// sql to select the value off the ram column and replace it with "no ram provided" if it is null
app.get('/selectCoalesceProducts', async(req,res)=>{
  try{
    const data=await db.query("select  coalesce(ram,'no ram provided') from index group by ram")
    res.json(data.rows)
  }
  catch (err){
    console.log(err)
    console.log('an error occured')
  }  
 })

//  to get the current date
app.get('/date', async(req,res)=>{
  try{
    const data=await db.query("select now()")
    res.json(data.rows)
  }
  catch (err){
    console.log(err)
    console.log('an error occured')
  }  
 })

//  to get the current time
app.get('/time', async(req,res)=>{
  try{
    const data=await db.query("select now()::time")
    res.json(data.rows)
  }
  catch (err){
    console.log(err)
    console.log('an error occured')
  }  
 })

//  to get the current date
app.get('/date', async(req,res)=>{
  try{
    const data=await db.query("select now()::date")
    res.json(data.rows)
  }
  catch (err){
    console.log(err)
    console.log('an error occured')
  }  
 })

//  to get the current date minus one year
app.get('/dateYearInterval', async(req,res)=>{
  try{
    const data=await db.query("select now() - interval '1 year' ")
    res.json(data.rows)
  }
  catch (err){
    console.log(err)
    console.log('an error occured')
  }  
 })

//  to get the current date minus one month
app.get('/dateMonthInterval', async(req,res)=>{
  try{
    const data=await db.query("select now() - interval '1 month' ")
    res.json(data.rows)
  }
  catch (err){
    console.log(err)
    console.log('an error occured')
  }  
 })

//  to get the current date minus 10 days
app.get('/dateDayInterval', async(req,res)=>{
  try{
    const data=await db.query("select now() - interval '10 days' as ten ")
    res.json(data.rows)
  }
  catch (err){
    console.log(err)
    console.log('an error occured')
  }  
 })

//  to get the current year only
app.get('/extractYear', async(req,res)=>{
  try{
    const data=await db.query("select extract( year from now() ) ")
    res.json(data.rows)
  }
  catch (err){
    console.log(err)
    console.log('an error occured')
  }  
 })

//  to get the current month only
app.get('/extractMonth', async(req,res)=>{
  try{
    const data=await db.query("select extract( month from now() ) ")
    res.json(data.rows)
  }
  catch (err){
    console.log(err)
    console.log('an error occured')
  }  
 })

//  to get the current day only
app.get('/extractDay', async(req,res)=>{
  try{
    const data=await db.query("select extract( day from now() ) ")
    res.json(data.rows)
  }
  catch (err){
    console.log(err)
    console.log('an error occured')
  }  
 })

//  to get the current day of the week only
app.get('/extractDayOfTheWeek', async(req,res)=>{
  try{
    const data=await db.query("select extract( dow from now() ) ")
    res.json(data.rows)
  }
  catch (err){
    console.log(err)
    console.log('an error occured')
  }  
 })
//changes the format of dob to include time,days,months,years
app.get('/age', async(req,res)=>{
  try{
    const data=await db.query("select age(now(), date_of_birth) ")
    res.json(data.rows)
  }
  catch (err){
    console.log(err)
    console.log('an error occured')
  }  
 })

 //delete all the data in a table
app.get('/delete', async(req,res)=>{
  try{
    const data=await db.query("delete table index ")
    res.json(data.rows)
  }
  catch (err){
    console.log(err)
    console.log('an error occured')
  }  
 })

//delete from table where the value of the number column is 3
app.get('/deleteWhere', async(req,res)=>{
  try{
    const data=await db.query("delete from index where no = 3")
    res.json(data.rows)
  }
  catch (err){
    console.log(err)
    console.log('an error occured')
  }  
 })

 //delete all the data in a table Note the differenc between delete and truncate is tha with delete ,you can roll back  the delete statement whereas with truncate you can't roll back the delete statement
app.get('/truncate', async(req,res)=>{
  try{
    const data=await db.query("truncate table index ")
    res.json(data.rows)
  }
  catch (err){
    console.log(err)
    console.log('an error occured')
  }  
 })

//adding a primary key
app.get('/alter', async(req,res)=>{
  try{
    const data=await db.query("alter table index add primary key (no)")
    res.json(data.rows)
  }
  catch (err){
    console.log(err)
    console.log('an error occured')
  }  
 })

//checks if the gender is equal male or female,returns error if gender is not equal to male or female
app.get('/check', async(req,res)=>{
  try{
    const data=await db.query("alter table index add constraint gender_constraint check (gender = 'male' or gender = 'female')")
    res.json(data.rows)
  }
  catch (err){
    console.log(err)
    console.log('an error occured')
  }  
 })

// query to update a particular row
 app.get('/update', async(req,res)=>{
  try{
    const data=await db.query("update  index set network = '4G' where no = 10 ")
    res.json(data.rows)
  }
  catch (err){
    console.log(err)
    console.log('an error occured')
  }  
 })

//  this query is used on columns with the unique constraints or primary key it overrides the unique constraint and inserts a value wether it is already there or not
 app.get('/insertOnConflict', async(req,res)=>{
  try{
    const data=await db.query("insert into table (name,age,sex) values ('sam',24,'male') on conflict (name) do nothing ")
    res.json(data.rows)
  }
  catch (err){
    console.log(err)
    console.log('an error occured')
  }  
 })
 
// this query is used on columns with the unique constraints or primary key it overrides the unique constraint it updates the value when there is a conflict
 app.get('/insertOnConflictUpdate', async(req,res)=>{
  try{
    const data=await db.query("insert into table (id,name,age,sex) values (1,'sam',24,'male') on conflict (id) do update set name = excluded.name ")
    res.json(data.rows)
  }
  catch (err){
    console.log(err)
    console.log('an error occured')
  }  
 })

// query to join two tables (products and users) where their foreign (users) key and primary (products) key match
app.get('/join', async(req,res)=>{
  try{
    // const data=await db.query("select products.laptop,users.email from products join users on product.id = users.id ")
    const data=await db.query("select * from products join users on product.id = users.id ")
    res.json(data.rows)
  }
  catch (err){
    console.log(err)
    console.log('an error occured')
  }  
 })

 // query to join two tables (products and users) where their foreign (users) key and primary (products) key are the same
app.get('/joinUsing', async(req,res)=>{
  try{
    const data=await db.query("select * from products join users using (product.id)")
    res.json(data.rows)
  }
  catch (err){
    console.log(err)
    console.log('an error occured')
  }  
 })

// query to  join two tables (products and users) regardless of wether their foreign (users) key and primary (products) key match or not
app.get('/leftJoin', async(req,res)=>{
  try{
    // const data=await db.query("select products.laptop,users.email from products left join users on product.id = users.id ")
    const data=await db.query("select * from products left join users on product.id = users.id ")
    res.json(data.rows)
  }
  catch (err){
    console.log(err)
    console.log('an error occured')
  }  
 })

// query to list available extensions
app.get('/extensions', async(req,res)=>{
  try{
    const data=await db.query("select * from pg_available_extensions ")
    res.json(data.rows)
  }
  catch (err){
    console.log(err)
    console.log('an error occured')
  }  
 })

// query to create an extension called  uuid-ossp for generating unique id's
app.get('/createExtensions', async(req,res)=>{
  try{
    const data=await db.query('create extension if not exists "uuid-ossp" ')
    res.json(data.rows)
  }
  catch (err){
    console.log(err)
    console.log('an error occured')
  }  
 })

// query to create a unique id
app.get('/uuid', async(req,res)=>{
  try{
    // Note uuid_generate_v4 is the function name, to get a list of the function name run command \df on terminal
    const data=await db.query("select uuid_generate_v4()")
    res.json(data.rows)
  }
  catch (err){
    console.log(err)
    console.log('an error occured')
  }  
 })

// query to insert a universally unique id
app.get('/insertUuid', async(req,res)=>{
  try{
    // Note the type for the id must be uuid
    const data=await db.query("insert into users (id,name,sex) values (uuid_generate_v4(),sarah,female) ")
    res.json(data.rows)
  }
  catch (err){
    console.log(err)
    console.log('an error occured')
  }  
 })

// query to replace an existion row with a new value it works like a delete statement followed by an insert statement if the data does not exist a simple insert is done instead
app.get('/replace', async(req,res)=>{
  try{
    // Note the type for the id must be uuid
    const data=await db.query("replace into users (id,name,sex) values (2,sandra,female) ")
    res.json(data.rows)
  }
  catch (err){
    console.log(err)
    console.log('an error occured')
  }  
 })

//  query to insert a data and update the value if it already exists in a given field (duplicate) Note:this query works on primary key and foreign key
app.get('/insertOnDuplicateUpdate', async(req,res)=>{
  try{
    const data=await db.query("insert into users (id,name,sex) values (2,sarah,female) on duplicate update id=4,name='john',sex='male'  ")
    res.json(data.rows)
  }
  catch (err){
    console.log(err)
    console.log('an error occured')
  }  
 })

 // query to give a warning rather than throw an error when a duplicate insert is made on a unique column,when a null value is added to a not null constraint or when an insert value does not match the check,enum condition
//  Note: the insert is not made it only gives an error
app.get('/insertIgnore', async(req,res)=>{
  try{
    // Note the type for the id must be uuid
    const data=await db.query("insert ignore into users (id,name,sex) values (uuid_generate_v4(),sarah,female) ")
    res.json(data.rows)
  }
  catch (err){
    console.log(err)
    console.log('an error occured')
  }  
 })
