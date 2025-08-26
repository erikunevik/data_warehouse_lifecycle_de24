# 2

#### A) What are the main components of Snowflake's architecture?

Snowflake’s architecture has three main layers (DSL, QPL, CSL):
1. Database Storage Layer – stores all structured and semi-structured data.
2. Compute Layer (Virtual Warehouses) – provides compute power to run queries.
3. Cloud Services Layer – manages metadata, security, authentication, and query optimization.

#### B) Explain the role of the storage layer in Snowflake.

The storage layer is responsible for how Snowflake stores all your data (structured & semi-structured) in the cloud.

The storage layer in Snowflake stores all structured and semi-structured data in compressed micro-partitions on cloud storage. It is fully managed: Snowflake handles partitioning, indexing, encryption, and metadata automatically. Storage is independent from compute, allowing unlimited scalability and support for JSON, Avro, and Parquet. It also enables features like Time Travel and Fail-Safe for data recovery.

The storage layer is Snowflake’s foundation — it persists data securely, compresses it efficiently, and organizes it automatically, while staying separate from compute so you can scale each independently.

#### C) What is the purpose of the compute layer in Snowflake?

The compute layer consists of Virtual Warehouses that provide the processing power for running queries, loading data, and transforming data.

- Executes all SQL operations: queries, joins, aggregations, transformations.

- Independent from storage → you can scale compute up/down without moving data.

- Multiple warehouses can access the same data at the same time (true concurrency).

- Warehouses can be resized (XS, S, M, …) or clustered for auto-scaling to match workload.

- You only pay credits while compute is running; storage costs are separate.

#### D) How does the cloud services layer enhance the functionality of Snowflake?

The Cloud Services Layer is the “brain” that ties Snowflake together. It provides the coordination, security, and optimization functions in Snowflake. It ensures queries are parsed, optimized, secure, and executed efficiently across storage and compute.

#### E)  What is a virtual warehouse in Snowflake, and how does it differ from a traditional data warehouse?

A virtual warehouse in Snowflake is a compute cluster that provides the processing power to run queries, load data, and perform transformations. It does not store data itself — it only executes operations against data in the storage layer. Warehouses can be scaled up/down or suspended/resumed on demand, and multiple warehouses can access the same data simultaneously for true concurrency. It´s Snowflake’s elastic compute engine — unlike traditional data warehouses, it is independent of storage, can scale instantly, and is billed only for actual usage.

#### F) When are the cases you would want to scale up versus scaling out in terms of virtual warehouses and compute resources.

⚡ Scale Up (bigger warehouse size: XS → S → M …)

When you need more power per query

Useful for:

Long-running, compute-intensive queries (complex joins, big aggregations, ML feature prep).

Large data transformations that a smaller warehouse struggles to finish quickly.

👉 Scale up = one query runs faster.

⚡ Scale Out (multi-cluster warehouses: 1 → 2 → N clusters)

When you need more concurrency (many users/queries at the same time)

Useful for:

BI dashboards with lots of users hitting the system simultaneously.

Many ETL jobs running in parallel.

👉 Scale out = more queries run smoothly at the same time, but individual queries aren’t necessarily faster.

Scale up = speed up a single heavy query.

Scale out = handle lots of queries/users at once.

#### G) How does Snowflake's pricing model differ from traditional on-premise data warehousing solutions?

Snowflake uses a pay-as-you-go model: you pay separately for compute (credits per second, per warehouse size) and storage (TB/month). Compute can be scaled up/down or paused so you only pay when it runs.
Traditional on-prem data warehouses require large up-front hardware and license costs, run 24/7 whether used or not, and scaling means buying more servers.
In short: Snowflake = elastic, usage-based OpEx, while on-prem = fixed CapEx with high maintenance overhead.

#### H) What is the difference between pay-as-you-go and upfront storage, and when you should you choose one over the other?

Pay-as-you-go = billed on actual usage (good for variable storage needs).
Upfront = billed at a fixed price for reserved capacity (good for steady workloads, often cheaper per TB).
Choose pay-as-you-go if your data volumes fluctuate.
Choose upfront if you know you’ll consistently use a set amount of storage.

#### I) Explain the concept of Time Travel and Fail-safe in Snowflake and its use cases

Time Travel = self-service rewind/restore (1–90 days).

Fail-safe = Snowflake-managed recovery (7 extra days), only for emergencies.

# Glossary

| terminology       | explanation |
| ----------------- | ----------- |
| downstream        | Processes or systems that **depend on your output** (e.g. dashboards, reports). |
| upstream          | Processes or systems that **feed data into your pipeline** (e.g. source systems, raw feeds). |
| data warehouse    | A **central repository** that stores integrated, historical data for analysis and reporting. |
| cloud computing   | Delivering IT resources (compute, storage, services) **on-demand via the internet**, pay-as-you-go. |
| OLAP              | Online Analytical Processing – optimized for **analytics, aggregations, and BI** queries. |
| OLTP              | Online Transaction Processing – optimized for **day-to-day transactions** (insert, update, delete). |
| virtual warehouse | A **compute cluster** in Snowflake that provides processing power for queries; it does not store data. |
| external stage    | A pointer to **external cloud storage** (S3, Azure Blob, GCP) for loading/unloading data into Snowflake. |
| data consumer     | A person, application, or system that **uses the data** (e.g. analyst, BI tool). |
| scaling out       | Adding **more clusters** to handle higher concurrency (many users/queries simultaneously). |
| scaling up        | Increasing the **size of a warehouse** (XS → S → M …) to give more power to each query. |
| snowflake credit  | The **billing unit** in Snowflake; represents compute consumed per second, per warehouse size. |
| securable object  | Any object that **can have access controls applied** (databases, schemas, tables, views, warehouses, etc.). |
| schema            | A logical container (like a folder) that holds tables, views, and other objects inside a database. |
| permanent table   | A standard table that **persists until dropped** and has full Time Travel & Fail-safe. |
| transient table   | A table that **persists beyond a session**, but has **reduced data protection** (no Fail-safe). |
| temporary table   | A table that exists only for the **duration of a session** and is dropped automatically. |
| time-travel       | A feature that lets you **query, clone, or restore data to a past state** (1–90 days depending on edition). |
| fail-safe         | A **7-day Snowflake-managed recovery period** after Time Travel has expired (emergency only). |
| view              | A **saved SQL query** that presents data from one or more tables without storing it physically. |
| table             | A data storage object organized in **rows and columns**. |
| DML               | Data Manipulation Language – e.g. **INSERT, UPDATE, DELETE**. |
| DDL               | Data Definition Language – e.g. **CREATE, ALTER, DROP** (define structures). |
| DQL               | Data Query Language – typically just **SELECT** statements. |
| DCL               | Data Control Language – e.g. **GRANT, REVOKE** (manage permissions). |
