#CIA_002

library(DBI)
library(RMySQL)


# Establish connection
con <- dbConnect(
  RMySQL::MySQL(),
  dbname = "cia_002",
  host = "localhost", # Replace with your host (e.g., IP address)
  port = 3306,        # Default MySQL port
  user = "root",
  password = "mysqlnidhi"
)

# Example: Fetch all data from orders table
# Query tables
orders <- dbGetQuery(con, "SELECT * FROM orders;")
products <- dbGetQuery(con, "SELECT * FROM products;")
invoices <- dbGetQuery(con, "SELECT * FROM invoices;")

dbDisconnect(con)

#BARCHART
orders_summary <- orders %>%
  group_by(user_id) %>%
  summarize(total_orders = n(), total_amount = sum(total_amount))


ggplot(orders_summary, aes(x = factor(user_id), y = total_orders)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  labs(title = "Total Orders by User", x = "User ID", y = "Number of Orders") +
  theme_minimal()



#PIE CHART
ggplot(products, aes(x = "", y = stock, fill = name)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y") +
  labs(title = "Stock Distribution by Product", x = NULL, y = NULL) +
  theme_minimal() +
  theme(axis.text.x = element_blank())


#LINE CHART
# Convert invoice_date to Date format
invoices$invoice_date <- as.Date(invoices$invoice_date)

# Line chart
ggplot(invoices, aes(x = invoice_date, y = total_amount)) +
  geom_line(color = "blue", size = 1) +
  geom_point(color = "red") +
  labs(title = "Invoices Over Time", x = "Invoice Date", y = "Total Amount") +
  theme_minimal()
