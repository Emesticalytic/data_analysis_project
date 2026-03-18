
# 1. Install required packages ───────────────────────────────────────────────
packages <- c("tidyverse", "ggplot2", "dplyr", "readr", 
              "scales",    "corrplot", "caret", "knitr")

for (pkg in packages) {
  if (!require(pkg, character.only = TRUE)) {
    install.packages(pkg)
    library(pkg, character.only = TRUE)
    cat("✅ Installed and loaded:", pkg, "\n")
  } else {
    cat("✅ Already installed:", pkg, "\n")
  }
}
library(dplyr)
# 2. Created a synthetic dataset
# 📦 scripts/02_create_data.R
# Creates all 5 datasets matching your SQL tables

install.packages("tidyverse")
library(tidyverse)

# ── EMPLOYEES ───────────────────────────────────────────────────────────────
employees <- data.frame(
  employee_id     = 1:15,
  first_name      = c("James","Sophia","Marcus","Rachel","David",
                      "Priya","Oliver","Amara","Liam","Fatima",
                      "Noah","Isla","Kwame","Chloe","Tariq"),
  last_name       = c("Hargreaves","Okafor","Patel","Thompson","Mensah",
                      "Nair","Bennett","Diallo","Walsh","Al-Hassan",
                      "Clarke","Ferguson","Asante","Whitfield","Hussain"),
  department      = c("Executive","Finance","Technology","Sales","Human Resources",
                      "Technology","Finance","Technology","Sales","Human Resources",
                      "Technology","Technology","Sales","Finance","Technology"),
  job_title       = c("CEO","CFO","CTO","Head of Sales","Head of HR",
                      "Engineering Manager","Finance Manager","Senior Data Analyst",
                      "Sales Executive","HR Specialist","Junior Developer",
                      "Data Analyst","Sales Executive","Financial Analyst",
                      "IT Consultant"),
  salary          = c(95000,88000,91000,72000,68000,
                      78000,70000,58000,45000,42000,
                      36000,40000,44000,47000,55000),
  employment_type = c(rep("Full-Time",12),"Part-Time","Full-Time","Contract"),
  status          = c(rep("Active",11),"On Leave","Active","Active","Active"),
  office_location = c("London HQ","London HQ","Manchester","London HQ","London HQ",
                      "Manchester","London HQ","Manchester","Birmingham","London HQ",
                      "Manchester","Manchester","Birmingham","London HQ","Remote"),
  marital_status  = c("Married","Single","Divorced","Married","Civil Partner",
                      "Single","Separated","Married","Single","Married",
                      "Single","Civil Partner","Divorced","Single","Separated"),
  manager_id      = c(NA,NA,NA,1,1,3,2,6,4,5,6,6,4,7,3),
  hire_date       = as.Date(c("2018-03-15","2019-01-20","2019-07-11",
                              "2020-02-28","2020-06-01","2021-03-15",
                              "2021-09-01","2022-01-10","2022-04-19",
                              "2022-07-05","2023-02-20","2023-05-15",
                              "2023-08-01","2024-01-08","2024-03-25"))
)

# ── CUSTOMERS ───────────────────────────────────────────────────────────────
customers <- data.frame(
  customer_id    = 1:15,
  first_name     = c("Emily","Daniel","Amelia","Benjamin","Charlotte",
                     "George","Hannah","Isaac","Jasmine","Kevin",
                     "Laura","Michael","Natalie","Oscar","Patricia"),
  last_name      = c("Richardson","Osei","Thornton","Owusu","Yeboah",
                     "Adeyemi","Fitzgerald","Mensah","Blackwood","Asante",
                     "Simmons","Darko","Hughes","Frimpong","Kimani"),
  city           = c("London","Manchester","Edinburgh","Birmingham","Leeds",
                     "London","Bristol","Cardiff","Nottingham","Liverpool",
                     "Sheffield","Newcastle","Leicester","Southampton","Coventry"),
  customer_tier  = c("Platinum","Platinum","Gold","Gold","Gold",
                     "Silver","Silver","Silver","Silver","Silver",
                     "Bronze","Bronze","Bronze","Bronze","Bronze"),
  loyalty_points = c(5200,4800,3100,2900,2750,
                     1500,1350,1100,980,870,
                     320,210,150,90,0),
  is_active      = c(rep(TRUE,14), FALSE),
  signup_date    = as.Date(c("2020-01-15","2020-03-22","2021-02-10",
                             "2021-06-30","2021-08-17","2022-01-05",
                             "2022-03-19","2022-07-08","2022-09-14",
                             "2022-11-01","2023-04-12","2023-06-25",
                             "2023-09-03","2024-01-17","2024-03-10"))
)

# ── PRODUCTS ────────────────────────────────────────────────────────────────
products <- data.frame(
  product_id   = 1:15,
  product_name = c("Wireless Bluetooth Headphones","Smart Home Speaker",
                   "USB-C Laptop Charging Hub","4K Webcam",
                   "Mechanical Keyboard","Ergonomic Office Chair",
                   "Standing Desk (Electric)","A4 Printer Paper",
                   "Ballpoint Pen Set","Desk Organiser Set",
                   "Project Management Software","Cloud Backup Solution",
                   "Laptop Sleeve 15","Monitor Privacy Screen 24",
                   "Wireless Charging Pad"),
  category     = c(rep("Electronics",5), rep("Office",5),
                   rep("Software",2),    rep("Accessories",3)),
  unit_price   = c(149.99,89.99,49.99,119.99,79.99,
                   299.99,499.99,6.99,4.99,24.99,
                   199.99,79.99,19.99,39.99,24.99),
  cost_price   = c(72.00,41.00,18.50,55.00,34.00,
                   140.00,230.00,2.50,1.20,9.50,
                   40.00,15.00,6.50,14.00,8.00),
  stock_quantity = c(120,95,200,60,85,
                     35,18,500,800,150,
                     999,999,250,70,180),
  reorder_level  = c(20,15,30,10,15,
                     5,5,50,80,20,
                     0,0,30,10,25)
)

# ── ORDERS ──────────────────────────────────────────────────────────────────
orders <- data.frame(
  order_id       = 1:15,
  customer_id    = c(1,2,3,4,5,6,7,8,1,2,9,10,11,12,3),
  employee_id    = c(9,9,13,9,13,9,13,9,13,9,13,9,13,9,13),
  order_date     = as.Date(c("2024-09-05","2024-09-12","2024-09-20",
                             "2024-10-01","2024-10-08","2024-10-15",
                             "2024-10-22","2024-11-03","2024-11-10",
                             "2024-11-18","2024-11-25","2024-12-02",
                             "2024-12-10","2024-12-15","2024-12-18")),
  order_status   = c(rep("Delivered",12),"Processing","Pending","Cancelled"),
  payment_status = c(rep("Paid",13),"Unpaid","Refunded"),
  shipping_cost  = c(5.99,5.99,7.99,5.99,5.99,
                     5.99,7.99,7.99,0.00,0.00,
                     5.99,5.99,5.99,5.99,0.00),
  discount_amount = c(0,10,0,5,0,0,0,0,20,15,0,0,0,0,0)
)

# ── SALES ───────────────────────────────────────────────────────────────────
sales <- data.frame(
  sale_id      = 1:20,
  order_id     = c(1,1,2,2,3,3,4,5,5,6,6,7,7,8,8,9,9,10,11,11),
  product_id   = c(1,3,5,13,6,10,7,2,15,11,12,4,14,8,9,1,3,6,2,15),
  employee_id  = c(9,9,9,9,13,13,9,13,13,9,9,13,13,9,9,13,13,9,13,13),
  sale_date    = as.Date(c(rep("2024-09-05",2), rep("2024-09-12",2),
                           rep("2024-09-20",2), "2024-10-01",
                           rep("2024-10-08",2), rep("2024-10-15",2),
                           rep("2024-10-22",2), rep("2024-11-03",2),
                           rep("2024-11-10",2), "2024-11-18",
                           rep("2024-11-25",2))),
  quantity     = c(1,2,1,2,1,1,1,1,2,1,1,1,1,5,3,2,3,1,1,1),
  unit_price   = c(149.99,49.99,79.99,19.99,299.99,24.99,499.99,
                   89.99,24.99,199.99,79.99,119.99,39.99,
                   6.99,4.99,149.99,49.99,299.99,89.99,24.99),
  discount_pct = c(0,0,10,10,0,0,5,0,0,0,0,0,0,0,0,10,10,15,0,0)
)

# ── Calculate line_total ─────────────────────────────────────────────────────
sales <- sales %>%
  mutate(
    line_total = round(quantity * unit_price * (1 - discount_pct / 100), 2),
    month      = format(sale_date, "%b")   # Jan, Feb, Sep etc.
  )


# ── Save all datasets to /data/raw ───────────────────────────────────────────
write_csv(employees, "data_analysis_project/data/raw/employees.csv")
write_csv(customers, "data_analysis_project/data/raw/customers.csv")
write_csv(products,  "data_analysis_project/data/raw/products.csv")
write_csv(orders,    "data_analysis_project/data/raw/orders.csv")
write_csv(sales,     "data_analysis_project/data/raw/sales.csv")

cat("✅ All 5 datasets created and saved to data/raw/ \n")


# 3
# 📊 scripts/03_descriptive.R

library(tidyverse)
library(ggplot2)
library(scales)

# ── Load data ────────────────────────────────────────────────────────────────
sales     <- read_csv("data_analysis_project/data/raw/sales.csv")
products  <- read_csv("data_analysis_project/data/raw/products.csv")
employees <- read_csv("data_analysis_project/data/raw/employees.csv")

# ── 1. Basic Summary Statistics ──────────────────────────────────────────────
cat("=== SALES TABLE SUMMARY ===\n")
sales %>%
  summarise(
    row_count    = n(),
    min_sales    = min(line_total),
    max_sales    = max(line_total),
    avg_sales    = round(mean(line_total), 2),
    total_revenue = sum(line_total)
  ) %>% print()

# ── 2. Monthly Revenue Summary ───────────────────────────────────────────────
monthly_summary <- sales %>%
  mutate(month = factor(month, levels = month.abb)) %>%
  group_by(month) %>%
  summarise(
    total_transactions = n(),
    total_units_sold   = sum(quantity),
    monthly_revenue    = sum(line_total),
    avg_sale_value     = round(mean(line_total), 2)
  ) %>%
  arrange(month)

print(monthly_summary)

# ── 3. Plot Monthly Revenue ───────────────────────────────────────────────────
ggplot(monthly_summary, aes(x = month, y = monthly_revenue, fill = month)) +
  geom_col(width = 0.6) +
  geom_text(aes(label = paste0("£", comma(monthly_revenue))),
            vjust = -0.4, size = 3, fontface = "bold") +
  scale_y_continuous(labels = label_comma(prefix = "£")) +
  scale_fill_manual(values = c("Sep" = "#3498DB",
                               "Oct" = "#2ECC71",
                               "Nov" = "#E74C3C")) +
  labs(
    title    = "Monthly Revenue-Sep to Nov 2024",
    subtitle = "Total sales revenue grouped by month",
    x        = "Month",
    y        = "Revenue (£)",
    caption  = "Source: Sales Table"
  ) +
  theme_minimal(base_size = 13) +
  theme(legend.position = "none")

ggsave("data_analysis_project/plots/01_monthly_revenue.png",
       width = 8, height = 5)
cat("✅ Plot saved: plots/01_monthly_revenue.png\n")

#  4. Top 5 Products By Revenue ─────────────────────────────────────────────
top_products <- sales %>%
  left_join(products, by = "product_id") %>%
  group_by(product_name, category) %>%
  summarise(
    total_revenue = sum(line_total),
    units_sold    = sum(quantity),
    .groups       = "drop"
  ) %>%
  arrange(desc(total_revenue)) %>%
  slice_head(n = 5)

print(top_products)

ggplot(top_products, aes(x = reorder(product_name, total_revenue),
                         y = total_revenue, fill = category)) +
  geom_col(width = 0.6) +
  geom_text(aes(label = paste0("£", comma(total_revenue))),
            hjust = -0.1, size = 3.5) +
  coord_flip() +
  scale_y_continuous(labels = label_comma(prefix = "£"),
                     expand = expansion(mult = c(0, 0.2))) +
  labs(
    title = "Top 5 Products By Revenue",
    x     = NULL,
    y     = "Total Revenue (£)"
  ) +
  theme_minimal(base_size = 12)

ggsave("data_analysis_project/plots/02_top_products.png",
       width = 9, height = 5)
cat("✅ Plot saved: plots/02_top_products.png\n")

#  5. Salary Distribution ───────────────────────────────────────────────────
ggplot(employees, aes(x = salary, fill = department)) +
  geom_histogram(bins = 8, colour = "white") +
  scale_x_continuous(labels = label_comma(prefix = "£")) +
  labs(
    title = "Employee Salary Distribution By Department",
    x     = "Salary (£)",
    y     = "Count"
  ) +
  theme_minimal(base_size = 12)

ggsave("data_analysis_project/plots/03_salary_distribution.png",
       width = 9, height = 5)
cat("✅ Plot saved: plots/03_salary_distribution.png\n")

# Diagnostic Analysis


library(tidyverse)
library(ggplot2)
library(scales)

customers <- read_csv("data_analysis_project/data/raw/customers.csv")
orders    <- read_csv("data_analysis_project/data/raw/orders.csv")
sales     <- read_csv("data_analysis_project/data/raw/sales.csv")

# ── 1. Churn Rate By City ────────────────────────────────────────────────────
churn_by_city <- customers %>%
  group_by(city) %>%
  summarise(
    total_customers = n(),
    churned         = sum(!is_active),
    churn_rate_pct  = round(mean(!is_active) * 100, 2)
  ) %>%
  arrange(desc(churn_rate_pct))

print(churn_by_city)

# ── 2. Churn Rate By Customer Tier ───────────────────────────────────────────
churn_by_tier <- customers %>%
  mutate(customer_tier = factor(customer_tier,
                                levels = c("Bronze","Silver","Gold","Platinum"))) %>%
  group_by(customer_tier) %>%
  summarise(
    total     = n(),
    churned   = sum(!is_active),
    churn_pct = round(mean(!is_active) * 100, 2)
  )

print(churn_by_tier)

ggplot(churn_by_tier, aes(x = customer_tier,
                          y = churn_pct, fill = customer_tier)) +
  geom_col(width = 0.5) +
  geom_text(aes(label = paste0(churn_pct, "%")),
            vjust = -0.3, fontface = "bold") +
  scale_fill_manual(values = c("Bronze"   = "#CD7F32",
                               "Silver"   = "#C0C0C0",
                               "Gold"     = "#FFD700",
                               "Platinum" = "#E5E4E2")) +
  labs(
    title = "Churn Rate By Customer Tier",
    x     = "Tier",
    y     = "Churn Rate (%)"
  ) +
  theme_minimal(base_size = 12) +
  theme(legend.position = "none")

ggsave("data_analysis_project/plots/04_churn_by_tier.png",
       width = 7, height = 5)
cat("✅ Plot saved: plots/04_churn_by_tier.png\n")

# ── 3. Order Status Breakdown ────────────────────────────────────────────────
order_status <- orders %>%
  count(order_status) %>%
  mutate(pct = round(n / sum(n) * 100, 1))

print(order_status)

ggplot(order_status, aes(x = "", y = n, fill = order_status)) +
  geom_col(width = 1) +
  coord_polar("y") +
  geom_text(aes(label = paste0(order_status, "\n", pct, "%")),
            position = position_stack(vjust = 0.5), size = 3.5) +
  labs(title = "Order Status Distribution") +
  theme_void() +
  theme(legend.position = "none")

ggsave("data_analysis_project/plots/05_order_status.png",
       width = 6, height = 6)
cat("✅ Plot saved: plots/05_order_status.png\n")


# # 3. Order Status Breakdown ────────────────────────────────────────────────
order_status <- orders %>%
  count(order_status) %>%
  mutate(
    pct          = round(n / sum(n) * 100, 1),
    order_status = reorder(order_status, -n)   # ✅ minus = highest first
  )

ggplot(order_status, aes(x = order_status, y = pct,
                         fill = order_status)) +
  geom_col(width = 0.6, show.legend = FALSE) +
  
  geom_text(aes(label = paste0(pct, "%\n(", n, " orders)")),
            vjust    = -0.4,
            size     = 4,
            fontface = "bold") +
  
  scale_fill_manual(values = c(
    "Delivered"   = "#27AE60",
    "Cancelled"   = "#E74C3C",
    "Processing"  = "#9B59B6",
    "Pending"     = "#3498DB",
    "Refunded"    = "#F39C12"
  )) +
  
  scale_y_continuous(
    limits = c(0, 95),
    labels = function(x) paste0(x, "%")
  ) +
  
  labs(
    title    = "Order Status Distribution",
    subtitle = "15 total orders-October to December 2024",
    x        = NULL,
    y        = "Percentage of Orders",
    caption  = "Source: Orders Table"
  ) +
  
  theme_minimal(base_size = 13) +
  theme(
    plot.title    = element_text(face = "bold", size = 15),
    plot.subtitle = element_text(colour = "grey50"),
    axis.text.x   = element_text(face = "bold", size = 11)
  )

ggsave("data_analysis_project/plots/05_order_status.png",
       width = 9, height = 6, dpi = 150)

# Step 5 — Predictive Analysis
# predictive
install.packages("caret") # Classification, And REgression, Training for ML
library(tidyverse)
library(caret)

customers <- read_csv("data_analysis_project/data/raw/customers.csv")
orders    <- read_csv("data_analysis_project/data/raw/orders.csv")
sales     <- read_csv("data_analysis_project/data/raw/sales.csv")

# ── 1. Build Feature Set ─────────────────────────────────────────────────────
customer_features <- customers %>%
  left_join(orders, by = "customer_id") %>%
  left_join(sales,  by = "order_id") %>%
  group_by(customer_id, customer_tier, loyalty_points, is_active) %>%
  summarise(
    total_orders   = n_distinct(order_id,  na.rm = TRUE),
    total_spend    = sum(line_total,        na.rm = TRUE),
    avg_order_val  = mean(line_total,       na.rm = TRUE),
    .groups        = "drop"
  ) %>%
  mutate(
    churned        = as.factor(ifelse(!is_active, 1, 0)),
    tier_numeric   = case_when(
      customer_tier == "Bronze"   ~ 1,
      customer_tier == "Silver"   ~ 2,
      customer_tier == "Gold"     ~ 3,
      customer_tier == "Platinum" ~ 4
    )
  ) %>%
  replace_na(list(total_spend = 0, avg_order_val = 0))

cat("=== FEATURE SET PREVIEW ===\n")
print(customer_features %>% 
        select(customer_id, customer_tier, loyalty_points,
               total_orders, total_spend, churned))

# ── 2. Train Logistic Regression Model ───────────────────────────────────────
set.seed(42)

model_data <- customer_features %>%
  select(loyalty_points, total_orders, total_spend,
         tier_numeric, churned)

install.packages("caret")
library(caret)
# Train/Test split
train_index <- createDataPartition(model_data$churned,
                                   p = 0.8, list = FALSE)
train_data  <- model_data[ train_index, ]
test_data   <- model_data[-train_index, ]

# Train model
model <- train(
  churned ~ .,
  data      = train_data,
  method    = "glm",
  family    = "binomial",
  trControl = trainControl(method = "cv", number = 5)
)

cat("\n=== MODEL SUMMARY ===\n")
print(summary(model$finalModel))

# Ignore above to split dataset due to the size of the sample

# ============================================================
#  05_predictive.R — Fixed for small dataset (15 rows)
# ============================================================
library(tidyverse)
library(caret)

customers <- read_csv("data_analysis_project/data/raw/customers.csv")
orders    <- read_csv("data_analysis_project/data/raw/orders.csv")
sales     <- read_csv("data_analysis_project/data/raw/sales.csv")

# ── Build feature set ─────────────────────────────────────────
customer_features <- customers %>%
  left_join(orders, by = "customer_id") %>%
  left_join(sales,  by = "order_id") %>%
  group_by(customer_id, customer_tier,
           loyalty_points, is_active) %>%
  summarise(
    total_orders  = n_distinct(order_id,  na.rm = TRUE),
    total_spend   = sum(line_total,        na.rm = TRUE),
    avg_order_val = mean(line_total,       na.rm = TRUE),
    .groups       = "drop"
  ) %>%
  mutate(
    churned      = as.factor(ifelse(!is_active, 1, 0)),
    tier_numeric = case_when(
      customer_tier == "Bronze"   ~ 1,
      customer_tier == "Silver"   ~ 2,
      customer_tier == "Gold"     ~ 3,
      customer_tier == "Platinum" ~ 4
    )
  ) %>%
  replace_na(list(total_spend = 0, avg_order_val = 0))

model_data <- customer_features %>%
  select(loyalty_points, total_orders,
         total_spend, tier_numeric, churned)

# ── Check class balance BEFORE modelling ──────────────────────
cat("=== CLASS BALANCE CHECK ===\n")
cat("Total rows:  ", nrow(model_data),                    "\n")
cat("Churned = 0: ", sum(model_data$churned == 0),        "\n")
cat("Churned = 1: ", sum(model_data$churned == 1),        "\n")
cat("Split needed?", ifelse(nrow(model_data) >= 100,
                            "YES - enough rows",
                            "NO  - dataset too small, use LOOCV"), "\n\n")

# ── Train using LOOCV (correct for small data) ────────────────
set.seed(42)

model <- train(
  churned ~ .,
  data      = model_data,
  method    = "glm",
  family    = "binomial",
  trControl = trainControl(method = "LOOCV")
)

cat("=== MODEL SUMMARY ===\n")
print(summary(model$finalModel))

# ── Risk scores for all customers ─────────────────────────────
customer_features$risk_score <- predict(
  model,
  newdata = customer_features,
  type    = "prob"
)[, "1"]

cat("\n=== CUSTOMER RISK SCORES ===\n")
customer_features %>%
  select(customer_id, customer_tier,
         loyalty_points, total_spend,
         risk_score, churned) %>%
  arrange(desc(risk_score)) %>%
  print()

# ── Save results ──────────────────────────────────────────────
write_csv(customer_features,
          "data_analysis_project/data/clean/customer_features.csv")
cat("\n✅ Saved: data/clean/customer_features.csv\n")

# 3. Predict On Test Set ───────────────────────────────────────────────────
predictions <- predict(model, test_data)
cat("\n=== CONFUSION MATRIX ===\n")
print(confusionMatrix(predictions, test_data$churned))

# ── 4. Risk Scores For All Customers ─────────────────────────────────────────
customer_features$risk_score <- predict(model, 
                                        newdata = customer_features,
                                        type    = "prob")[,"1"]

customer_features %>%
  select(customer_id, customer_tier, loyalty_points,
         total_spend, risk_score, churned) %>%
  arrange(desc(risk_score)) %>%
  print()

# ── Save clean feature set ───────────────────────────────────────────────────
write_csv(customer_features,
          "data_analysis_project/data/clean/customer_features.csv")
cat("\n✅ Feature set saved to data/clean/customer_features.csv\n")

# Step 6 — Prescriptive Analysis
r# 💡 scripts/06_prescriptive.R

library(tidyverse)
library(ggplot2)
library(scales)

customers <- read_csv("data_analysis_project/data/raw/customers.csv")
orders    <- read_csv("data_analysis_project/data/raw/orders.csv")
sales     <- read_csv("data_analysis_project/data/raw/sales.csv")
products  <- read_csv("data_analysis_project/data/raw/products.csv")

# ── 1. At Risk Customers With Offers ─────────────────────────────────────────
at_risk <- customers %>%
  mutate(
    risk_score = case_when(
      !is_active           ~ 0.9,
      loyalty_points < 500 ~ 0.7,
      loyalty_points < 1000 ~ 0.5,
      TRUE                 ~ 0.2
    ),
    recommended_offer = case_when(
      risk_score >= 0.8 & customer_tier == "Platinum" ~ "50% Discount",
      risk_score >= 0.7 & customer_tier %in% 
        c("Gold","Silver")         ~ "20% Discount",
      risk_score >= 0.5                               ~ "Double Loyalty Points",
      TRUE                                            ~ "No Action Needed"
    )
  ) %>%
  select(customer_id, first_name, last_name,
         customer_tier, loyalty_points,
         risk_score, recommended_offer) %>%
  arrange(desc(risk_score))

cat("=== AT RISK CUSTOMERS + RECOMMENDED OFFERS ===\n")
print(at_risk)

# ── 2. Plot Risk Score Distribution ──────────────────────────────────────────
ggplot(at_risk, aes(x = reorder(paste(first_name, last_name), risk_score),
                    y = risk_score, fill = recommended_offer)) +
  geom_col(width = 0.6) +
  coord_flip() +
  geom_hline(yintercept = 0.7, linetype = "dashed",
             colour = "red", linewidth = 0.8) +
  annotate("text", x = 1, y = 0.72,
           label = "Risk Threshold", colour = "red", size = 3.5) +
  scale_fill_manual(values = c(
    "50% Discount"          = "#E74C3C",
    "20% Discount"          = "#F39C12",
    "Double Loyalty Points" = "#3498DB",
    "No Action Needed"      = "#2ECC71"
  )) +
  labs(
    title = "Customer Risk Scores & Recommended Offers",
    x     = NULL,
    y     = "Risk Score (0–1)",
    fill  = "Offer"
  ) +
  theme_minimal(base_size = 11)

ggsave("data_analysis_project/plots/06_risk_offers.png",
       width = 10, height = 6)
cat("✅ Plot saved: plots/06_risk_offers.png\n")

# ── 3. Stock Alert ───────────────────────────────────────────────────────────
stock_alert <- products %>%
  mutate(
    stock_status = case_when(
      stock_quantity == 0                    ~ "OUT OF STOCK",
      stock_quantity <= reorder_level        ~ "REORDER NOW",
      TRUE                                   ~ "SUFFICIENT"
    ),
    profit_per_unit = unit_price - cost_price
  ) %>%
  arrange(stock_quantity)

cat("\n=== STOCK ALERT ===\n")
print(stock_alert %>% 
        select(product_name, stock_quantity,
               reorder_level, stock_status, profit_per_unit))

# ── Save outputs ─────────────────────────────────────────────────────────────
write_csv(at_risk,      "data_analysis_project/reports/at_risk_customers.csv")
write_csv(stock_alert,  "data_analysis_project/reports/stock_alert.csv")
cat("\n✅ Reports saved to reports/ folder\n")

# main.R — Run Everything At Once

cat("========================================\n")
cat("   DATA ANALYSIS PROJECT — RUNNING     \n")
cat("========================================\n\n")
# ============================================================
#  main.R — Always finds itself automatically
# ============================================================

# ── Auto-set working directory to where main.R lives ─────────
if (requireNamespace("rstudioapi", quietly = TRUE)) {
  setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
}

cat("✅ Working directory:", getwd(), "\n")
cat("✅ Folder exists:",     dir.exists("data_analysis_project"), "\n")

# ── Verify all scripts exist before running ───────────────────
scripts <- c(
  "data_analysis_project/scripts/01_setup.R",
  "data_analysis_project/scripts/02_create_data.R",
  "data_analysis_project/scripts/03_descriptive.R",
  "data_analysis_project/scripts/04_diagnostic.R",
  "data_analysis_project/scripts/05_predictive.R",
  "data_analysis_project/scripts/06_prescriptive.R"
)

cat("\n── Checking all scripts exist ───────────────────────\n")
all_found <- TRUE
for (script in scripts) {
  exists <- file.exists(script)
  cat(sprintf("   %-55s %s\n",
              script,
              ifelse(exists, "✅ FOUND", "❌ MISSING")))
  if (!exists) all_found <- FALSE
}

# ── Only run if all scripts found ────────────────────────────
if (!all_found) {
  stop("❌ Fix missing scripts above before running pipeline")
}

cat("\n── Running pipeline ─────────────────────────────────\n")
for (script in scripts) {
  cat("\n▶ Running:", script, "\n")
  source(script)
  cat("✅ Done:   ", script, "\n")
}

cat("\n============================================\n")
cat("   Project Completed\n")
cat("============================================\n")

# ============================================================
#  main.R — Fixed paths matching YOUR actual structure
# ============================================================

scripts <- c(
  "scripts/01_setup.R",
  "scripts/02_create_data.R",
  "scripts/03_descriptive.R",
  "scripts/04_diagnostic.R",
  "scripts/05_predictive.R",
  "scripts/06_prescriptive.R"
)

read_csv("data/raw/employees.csv")
write_csv(df, "data/raw/employees.csv")
ggsave("plots/chart.png")
# ✅ Test it right»

for (script in scripts) {
  cat("\n▶ Running:", basename(script), "\n")
  source(script)
  cat("✅ Done\n")
}

cat("\n✅ Pipeline complete\n")