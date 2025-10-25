INSERT INTO Customers (
    CustomerID, Gender, Age, Married, Dependents, NumberOfDependents,
    City, State, ZipCode, Country, Latitude, Longitude,
    SeniorCitizen, Under30
)
SELECT DISTINCT
    [Customer ID],
    [Gender],
    [Age],
    CASE WHEN [Married] = 'Yes' THEN 1 ELSE 0 END,
    CASE WHEN [Dependents] = 'Yes' THEN 1 ELSE 0 END,
    [Number of Dependents],
    [City],
    [State],
    [Zip Code],
    [Country],
    [Latitude],
    [Longitude],
    CASE WHEN [Senior Citizen] = 'Yes' THEN 1 ELSE 0 END,
    CASE WHEN [Under 30] = 'Yes' THEN 1 ELSE 0 END
FROM Customer_Churn_Data;


INSERT INTO Contracts (
    CustomerID, ContractType, Offer, TenureMonths, Quarter, PaperlessBilling
)
SELECT DISTINCT
    [Customer ID],
    [Contract],
    [Offer],
    [Tenure in Months],
    [Quarter],
    CASE WHEN [Paperless Billing] = 'Yes' THEN 1 ELSE 0 END
FROM Customer_Churn_Data;


INSERT INTO Services (
    CustomerID, InternetService, InternetType, PhoneService, MultipleLines,
    DeviceProtection, OnlineBackup, OnlineSecurity, TechSupport, PremiumTechSupport,
    StreamingMovies, StreamingMusic, StreamingTV, UnlimitedData
)
SELECT DISTINCT
    [Customer ID],
    [Internet Service],
    [Internet Type],
    CASE WHEN [Phone Service] = 'Yes' THEN 1 ELSE 0 END,
    CASE WHEN [Multiple Lines] = 'Yes' THEN 1 ELSE 0 END,
    CASE WHEN [Device Protection] = 'Yes' THEN 1 ELSE 0 END,
    CASE WHEN [Online Backup] = 'Yes' THEN 1 ELSE 0 END,
    CASE WHEN [Online Security] = 'Yes' THEN 1 ELSE 0 END,
    CASE WHEN [Tech Support] = 'Yes' THEN 1 ELSE 0 END,
    CASE WHEN [Premium Tech Support] = 'Yes' THEN 1 ELSE 0 END,
    CASE WHEN [Streaming Movies] = 'Yes' THEN 1 ELSE 0 END,
    CASE WHEN [Streaming Music] = 'Yes' THEN 1 ELSE 0 END,
    CASE WHEN [Streaming TV] = 'Yes' THEN 1 ELSE 0 END,
    CASE WHEN [Unlimited Data] = 'Yes' THEN 1 ELSE 0 END
FROM Customer_Churn_Data;


INSERT INTO Payments (
    CustomerID, PaymentMethod, PaymentType, MonthlyCharge, TotalCharges,
    TotalRevenue, TotalRefunds, TotalExtraDataCharges, TotalLongDistanceCharges, CLTV
)
SELECT DISTINCT
    [Customer ID],
    [Payment Method],
    [Payment Method Type],
    [Monthly Charge],
    [Total Charges],
    [Total Revenue],
    [Total Refunds],
    [Total Extra Data Charges],
    [Total Long Distance Charges],
    [CLTV]
FROM Customer_Churn_Data;


INSERT INTO Usage (
    CustomerID, AvgMonthlyGBDownload, AvgMonthlyLongDistanceCharges,
    ReferredAFriend, NumberOfReferrals, SatisfactionScore
)
SELECT DISTINCT
    [Customer ID],
    [Avg Monthly GB Download],
    [Avg Monthly Long Distance Charges],
    CASE WHEN [Referred a Friend] = 'Yes' THEN 1 ELSE 0 END,
    [Number of Referrals],
    [Satisfaction Score]
FROM Customer_Churn_Data;


INSERT INTO Churn (
    CustomerID, ChurnLabel, ChurnCategory, ChurnReason, ChurnScore, CustomerStatus
)
SELECT DISTINCT
    [Customer ID],
    CASE WHEN [Churn Label] = 'Yes' THEN 1 ELSE 0 END,
    [Churn Category],
    [Churn Reason],
    [Churn Score],
    [Customer Status]
FROM Customer_Churn_Data;


-- ✅ Verify record counts across all tables in customer_churn_db

USE customer_churn_db;
GO

-- 🧩 1. Base Customers Table
SELECT COUNT(*) AS Total_Customers FROM Customers;

-- 🧩 2. Contracts Table
SELECT COUNT(*) AS Total_Contracts FROM Contracts;

-- 🧩 3. Services Table
SELECT COUNT(*) AS Total_Services FROM Services;

-- 🧩 4. Payments Table
SELECT COUNT(*) AS Total_Payments FROM Payments;

-- 🧩 5. Usage Table
SELECT COUNT(*) AS Total_Usage FROM Usage;

-- 🧩 6. Churn Table
SELECT COUNT(*) AS Total_Churn FROM Churn;

-- 🧩 7. (Optional) Original Flat Table (for comparison)
IF OBJECT_ID('Customer_Churn_Data', 'U') IS NOT NULL
BEGIN
    SELECT COUNT(*) AS Total_Original_Flat_Data FROM Customer_Churn_Data;
END
ELSE
BEGIN
    PRINT '⚠️ Table [Customer_Churn_Data] not found — maybe already deleted or renamed.';
END;

SELECT *
FROM Customer_Churn_Data