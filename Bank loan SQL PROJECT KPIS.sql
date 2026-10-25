CREATE DATABASE Finance_Project;
USE Finance_Project;
CREATE TABLE finance_1 (
    id TEXT,
    member_id TEXT,
    loan_amnt TEXT,
    funded_amnt TEXT,
    funded_amnt_inv TEXT,
    term TEXT,
    int_rate TEXT,
    installment TEXT,
    grade TEXT,
    sub_grade TEXT,
    emp_title TEXT,
    emp_length TEXT,
    home_ownership TEXT,
    annual_inc TEXT,
    verification_status TEXT,
    issue_d TEXT,
    Issue_Year TEXT,
    loan_status TEXT,
    pymnt_plan TEXT,
    purpose TEXT,
    title TEXT,
    zip_code TEXT,
    addr_state TEXT,
    dti TEXT
);

CREATE TABLE finance_2 (
    id TEXT,
    delinq_2yrs TEXT,
    earliest_cr_line TEXT,
    inq_last_6mths TEXT,
    mths_since_last_delinq TEXT,
    mths_since_last_record TEXT,
    revol_bal TEXT,
    revol_util TEXT,
    initial_list_status TEXT,
    total_pymnt TEXT,
    total_pymnt_inv TEXT,
    total_rec_prncp TEXT,
    total_rec_int TEXT,
    total_rec_late_fee TEXT,
    recoveries TEXT,
    collection_recovery_fee TEXT,
    last_pymnt_d TEXT,
    Last_pymnt_Year TEXT,
    last_pymnt_amnt TEXT,
    last_credit_pull_d TEXT,
    Last_credit_pull_Year TEXT
);
SELECT COUNT(*) AS Total_Rows
FROM finance_1;

SELECT COUNT(*) AS Total_Rows
FROM finance_2;

SELECT COUNT(*)
FROM finance_1 f1
JOIN finance_2 f2
ON f1.id = f2.id;

## 1. Total Loan Amount
SELECT
    Issue_Year,
    SUM(CAST(loan_amnt AS DECIMAL(15,2))) AS Total_Loan_Amount,
    AVG(CAST(loan_amnt AS DECIMAL(15,2))) AS Average_Loan_Amount
FROM finance_1
GROUP BY Issue_Year
ORDER BY Issue_Year;

## 2. Total Payment Received
SELECT SUM(CAST(total_pymnt AS DECIMAL(15,2))) AS Total_Payment
FROM finance_2;

## 3. Loan Status Wise Count
SELECT loan_status, COUNT(*) AS Total_Loans
FROM finance_1
GROUP BY loan_status;

## 4. Grade Wise Loan Amount
SELECT grade,
       SUM(CAST(loan_amnt AS DECIMAL(15,2))) AS Total_Loan
FROM finance_1
GROUP BY grade
ORDER BY Total_Loan DESC;

## 5. State Wise Loan Count
SELECT addr_state,
       COUNT(*) AS Total_Loans
FROM finance_1
GROUP BY addr_state
ORDER BY Total_Loans DESC;

## 6. Recovery Amount
SELECT SUM(CAST(recoveries AS DECIMAL(15,2))) AS Total_Recovery
FROM finance_2;
