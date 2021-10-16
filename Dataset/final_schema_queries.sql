CREATE TABLE [Customer_Fact_Table] (
    [Customer_ID] int  NOT NULL ,
    [Pack_ID] int  NOT NULL ,
    [Subscription_Date] date  NOT NULL ,
    [Payment_Date] date  NOT NULL ,
    [Plan_Validity_Date] date  NOT NULL ,
    [Sales_Employee_ID] int  NOT NULL ,
    [Cancellation_Date] date NULL ,
    [Total_Amount] money  NOT NULL 
)

CREATE TABLE [Sales_Fact_Table] (
    [Empolyee_ID] int  NOT NULL ,
    [Date] date  NOT NULL ,
    [Quantity_Sold] int  NOT NULL ,
    [Total_Sales] int  NOT NULL 
)

CREATE TABLE [Revenue_Fact_Table] (
    [Customer_ID] int  NOT NULL ,
    [Pack_ID] int  NOT NULL ,
    [Payment_Date] date  NOT NULL ,
    [Revenue] money  NOT NULL 
)

CREATE TABLE [Customer_Dimension] (
    [Customer_ID] int  NOT NULL ,
    [Customer_Name] varchar(100)  NOT NULL ,
    [Age] int  NOT NULL ,
    [Sex] varchar(6)  NOT NULL ,
    [City] varchar(100)  NOT NULL ,
    [State] varchar(100)  NOT NULL ,
    [Mobile_No] bigint  NOT NULL ,
    [STB_Model_No] varchar(30)  NOT NULL ,
    [STB_Card_NO] varchar(100)  NOT NULL ,
    CONSTRAINT [PK_Customer_Dimension] PRIMARY KEY CLUSTERED (
        [Customer_ID] ASC
    )
)

CREATE TABLE [Pack_Dimension] (
    [Pack_ID] int  NOT NULL ,
    [Pack_Name] varchar(100)  NOT NULL ,
    [Pack_Cost] money  NOT NULL ,
    [Pack_Validity] int  NOT NULL ,
    CONSTRAINT [PK_Pack_Dimension] PRIMARY KEY CLUSTERED (
        [Pack_ID] ASC
    )
)

CREATE TABLE [Pack_to_Channel_Bridge] (
    [Pack_ID] int  NOT NULL ,
    [Channel_ID] int  NOT NULL 
)

CREATE TABLE [Channel_Dimension] (
    [Channel_ID] int  NOT NULL ,
    [Channel_Name] varchar(100)  NOT NULL ,
    CONSTRAINT [PK_Channel_Dimension] PRIMARY KEY CLUSTERED (
        [Channel_ID] ASC
    )
)

CREATE TABLE [Sales_Employee_Table] (
    [Sales_Employee_ID] int  NOT NULL ,
    [Employee_Name] varchar(100)  NOT NULL ,
    [Employee_Age] int  NOT NULL ,
    [Employee_Sex] varchar(100)  NOT NULL ,
    [Employee_City] varchar(100)  NOT NULL ,
    CONSTRAINT [PK_Sales_Employee_Table] PRIMARY KEY CLUSTERED (
        [Sales_Employee_ID] ASC
    )
)

CREATE TABLE [Plan_Validity_Date] (
    [Plan_Validity_Date] date  NOT NULL ,
    [Week] int  NOT NULL ,
    [Month] int NOT NULL ,
    [Year] int  NOT NULL ,
    CONSTRAINT [PK_Plan_Validity_Date] PRIMARY KEY CLUSTERED (
        [Plan_Validity_Date] ASC
    )
)

CREATE TABLE [Subscription_Date] (
    [Subscription_Date] date  NOT NULL ,
    [Week] int  NOT NULL ,
    [Month] int  NOT NULL ,
    [Year] int  NOT NULL ,
    CONSTRAINT [PK_Subscription_Date] PRIMARY KEY CLUSTERED (
        [Subscription_Date] ASC
    )
)

CREATE TABLE [Payment_Date] (
    [Payment_Date] date  NOT NULL ,
    [Week] int  NOT NULL ,
    [Month] int  NOT NULL ,
    [Year] int  NOT NULL ,
    CONSTRAINT [PK_Payment_Date] PRIMARY KEY CLUSTERED (
        [Payment_Date] ASC
    )
)

CREATE TABLE [Cancellation_Date] (
    [Cancellation_Date] date  NOT NULL ,
    [Week] int  NOT NULL ,
    [Month] int  NOT NULL ,
    [Year] int  NOT NULL ,
    CONSTRAINT [PK_Cancellation_Date] PRIMARY KEY CLUSTERED (
        [Cancellation_Date] ASC
    )
)

ALTER TABLE [Customer_Fact_Table] WITH CHECK ADD CONSTRAINT [FK_Customer_Fact_Table_Customer_ID] FOREIGN KEY([Customer_ID])
REFERENCES [Customer_Dimension] ([Customer_ID])

ALTER TABLE [Customer_Fact_Table] CHECK CONSTRAINT [FK_Customer_Fact_Table_Customer_ID]

ALTER TABLE [Customer_Fact_Table] WITH CHECK ADD CONSTRAINT [FK_Customer_Fact_Table_Pack_ID] FOREIGN KEY([Pack_ID])
REFERENCES [Pack_Dimension] ([Pack_ID])

ALTER TABLE [Customer_Fact_Table] CHECK CONSTRAINT [FK_Customer_Fact_Table_Pack_ID]

ALTER TABLE [Customer_Fact_Table] WITH CHECK ADD CONSTRAINT [FK_Customer_Fact_Table_Subscription_Date] FOREIGN KEY([Subscription_Date])
REFERENCES [Subscription_Date] ([Subscription_Date])

ALTER TABLE [Customer_Fact_Table] CHECK CONSTRAINT [FK_Customer_Fact_Table_Subscription_Date]

ALTER TABLE [Customer_Fact_Table] WITH CHECK ADD CONSTRAINT [FK_Customer_Fact_Table_Payment_Date] FOREIGN KEY([Payment_Date])
REFERENCES [Payment_Date] ([Payment_Date])

ALTER TABLE [Customer_Fact_Table] CHECK CONSTRAINT [FK_Customer_Fact_Table_Payment_Date]

ALTER TABLE [Customer_Fact_Table] WITH CHECK ADD CONSTRAINT [FK_Customer_Fact_Table_Plan_Validity_Date] FOREIGN KEY([Plan_Validity_Date])
REFERENCES [Plan_Validity_Date] ([Plan_Validity_Date])

ALTER TABLE [Customer_Fact_Table] CHECK CONSTRAINT [FK_Customer_Fact_Table_Plan_Validity_Date]

ALTER TABLE [Customer_Fact_Table] WITH CHECK ADD CONSTRAINT [FK_Customer_Fact_Table_Sales_Employee_ID] FOREIGN KEY([Sales_Employee_ID])
REFERENCES [Sales_Employee_Table] ([Sales_Employee_ID])

ALTER TABLE [Customer_Fact_Table] CHECK CONSTRAINT [FK_Customer_Fact_Table_Sales_Employee_ID]

ALTER TABLE [Customer_Fact_Table] WITH CHECK ADD CONSTRAINT [FK_Customer_Fact_Table_Cancellation_Date] FOREIGN KEY([Cancellation_Date])
REFERENCES [Cancellation_Date] ([Cancellation_Date])

ALTER TABLE [Customer_Fact_Table] CHECK CONSTRAINT [FK_Customer_Fact_Table_Cancellation_Date]

ALTER TABLE [Slaes_Fact_Table] WITH CHECK ADD CONSTRAINT [FK_Slaes_Fact_Table_Empolyee_ID] FOREIGN KEY([Empolyee_ID])
REFERENCES [Sales_Employee_Table] ([Sales_Employee_ID])

ALTER TABLE [Slaes_Fact_Table] CHECK CONSTRAINT [FK_Slaes_Fact_Table_Empolyee_ID]

ALTER TABLE [Slaes_Fact_Table] WITH CHECK ADD CONSTRAINT [FK_Slaes_Fact_Table_Date] FOREIGN KEY([Date])
REFERENCES [Subscription_Date] ([Subscription_Date])

ALTER TABLE [Slaes_Fact_Table] CHECK CONSTRAINT [FK_Slaes_Fact_Table_Date]

ALTER TABLE [Revenue_Fact_Table] WITH CHECK ADD CONSTRAINT [FK_Revenue_Fact_Table_Customer_ID] FOREIGN KEY([Customer_ID])
REFERENCES [Customer_Dimension] ([Customer_ID])

ALTER TABLE [Revenue_Fact_Table] CHECK CONSTRAINT [FK_Revenue_Fact_Table_Customer_ID]

ALTER TABLE [Revenue_Fact_Table] WITH CHECK ADD CONSTRAINT [FK_Revenue_Fact_Table_Pack_ID] FOREIGN KEY([Pack_ID])
REFERENCES [Pack_Dimension] ([Pack_ID])

ALTER TABLE [Revenue_Fact_Table] CHECK CONSTRAINT [FK_Revenue_Fact_Table_Pack_ID]

ALTER TABLE [Revenue_Fact_Table] WITH CHECK ADD CONSTRAINT [FK_Revenue_Fact_Table_Payment_Date] FOREIGN KEY([Payment_Date])
REFERENCES [Payment_Date] ([Payment_Date])

ALTER TABLE [Revenue_Fact_Table] CHECK CONSTRAINT [FK_Revenue_Fact_Table_Payment_Date]

ALTER TABLE [Pack_to_Channel_Bridge] WITH CHECK ADD CONSTRAINT [FK_Pack_to_Channel_Bridge_Pack_ID] FOREIGN KEY([Pack_ID])
REFERENCES [Pack_Dimension] ([Pack_ID])

ALTER TABLE [Pack_to_Channel_Bridge] CHECK CONSTRAINT [FK_Pack_to_Channel_Bridge_Pack_ID]

ALTER TABLE [Pack_to_Channel_Bridge] WITH CHECK ADD CONSTRAINT [FK_Pack_to_Channel_Bridge_Channel_ID] FOREIGN KEY([Channel_ID])
REFERENCES [Channel_Dimension] ([Channel_ID])

ALTER TABLE [Pack_to_Channel_Bridge] CHECK CONSTRAINT [FK_Pack_to_Channel_Bridge_Channel_ID]
