#question 1

SELECT * FROM T10_CUSTOMER,T10_VEHICLE WHERE T10_1_Cust_Id 
   IN (SELECT  T10_1_Cust_Id FROM T10_CLAIM 
         WHERE T10_7_Claim_Status ='Pending'AND T10_1_Cust_Id
     IN (SELECT  T10_1_Cust_Id FROM T10_INCIDENT_REPORT
		  WHERE T10_CUSTOMER.T10_1_Cust_Id= T10_INCIDENT_REPORT.T10_1_Cust_Id ))limit 4; 
          
select T10_VEHICLE.*, T10_CUSTOMER.* from T10_VEHICLE, T10_CUSTOMER where T10_VEHICLE.T10_6_Cust_Id and T10_CUSTOMER.T10_1_Cust_Id in (select T10_INCIDENT_REPORT.T10_1_Cust_Id from  T10_CLAIM inner join T10_INCIDENT_REPORT ON T10_CLAIM.T10_1_Cust_Id = T10_INCIDENT_REPORT.T10_1_Cust_Id where T10_7_Claim_status='Pending') ;
          
#question 2

select T10_CUSTOMER.* from T10_CUSTOMER WHERE T10_1_Cust_Id IN (SELECT T10_1_Cust_Id from T10_PREMIUM_PAYMENT WHERE  T10_PREMIUM_PAYMENT.T10_5_Premium_Payment_Amount > ANY(SELECT SUM(T10_1_Cust_Id) FROM T10_CUSTOMER));
#SELECT * FROM T10_PREMIUM_PAYMENT WHERE  T10_PREMIUM_PAYMENT.T10_5_Premium_Payment_Amount > (SELECT SUM(T10_1_Cust_Id) FROM T10_CUSTOMER);
        
#question 3

select *
    from  T10_INSURANCE_COMPANY
    where T10_10_Company_Name in
    (select T10_INSURANCE_COMPANY.T10_10_Company_Name
    from T10_INSURANCE_COMPANY
    group by T10_10_Company_Name
    having count(distinct (T10_10_Company_Address))>1 and T10_10_Company_Name in
    (select T10_DEPARTMENT.T10_10_Company_Name
    from T10_PRODUCT inner join T10_DEPARTMENT
    on T10_DEPARTMENT.T10_10_Company_Name = T10_PRODUCT.T10_10_Company_Name
    group by T10_DEPARTMENT.T10_10_Company_Name
    having count( DISTINCT(T10_15_Product_Number)) > count(distinct (T10_13_Department_Name))));

#question 4       
        
#select T10_1_Cust_Id from T10_INCIDENT_REPORT where T10_1_Cust_Id in( select T10_6_Cust_Id from T10_VEHICLE group by T10_6_Cust_Id having count(T10_6_Cust_Id)>1 and T10_6_Cust_Id 
#in (select T10_1_Cust_Id FROM T10_PREMIUM_PAYMENT WHERE T10_5_Premium_Payment_Amount = 0 )) and T10_14_Incident_Type='Accident';

select * from T10_CUSTOMER where T10_1_Cust_Id in (select T10_1_Cust_Id from T10_INCIDENT_REPORT 
where T10_1_Cust_Id in( select T10_6_Cust_Id from T10_VEHICLE where T10_6_Vehicle_Number>1 and T10_6_Cust_Id 
in (select T10_1_Cust_Id FROM T10_PREMIUM_PAYMENT WHERE T10_5_Premium_Payment_Amount = 0 )) and T10_14_Incident_Type='Accident');
        
#question 5

SELECT T10_VEHICLE.*,T10_5_Premium_Payment_Amount FROM T10_VEHICLE,T10_PREMIUM_PAYMENT 
WHERE (T10_5_Premium_Payment_Amount > T10_6_Vehicle_Number AND  T10_PREMIUM_PAYMENT.T10_1_Cust_Id = T10_VEHICLE.T10_6_Cust_Id );

#question 6

select * 
    from T10_CUSTOMER where T10_1_Cust_Id 
    in (select distinct (T10_CLAIM .T10_1_Cust_Id)
	from T10_CLAIM , T10_CLAIM_SETTLEMENT , T10_COVERAGE 
    where T10_CLAIM.T10_7_Claim_Amount > T10_CLAIM_SETTLEMENT.T10_8_Claim_Settlement_Id + T10_CLAIM_SETTLEMENT.T10_6_Vehicle_Id + T10_CLAIM.T10_7_Claim_Id + T10_CLAIM.T10_1_Cust_Id and T10_16_Coverage_Amount > T10_CLAIM.T10_7_Claim_Amount );
