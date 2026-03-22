import psycopg2

def fix_schema():
    conn_params = "postgresql://auraauser:auraapass@localhost:5433/auraacrackers"
    try:
        conn = psycopg2.connect(conn_params)
        cur = conn.cursor()
        
        schema_fix = {
            "tbl_category": ["categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy"],
            "tbl_items": ["categoryId", "itemCode", "itemName", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", "mrp", "taxId", "accountId", "minOrdQty", "discountPer", "freeQty", "locationId", "openingQty", "sortNo", "itemImage", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "isDisabled", "updatedBy"],
            "tbl_units": ["convFactor", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy"],
            "tbl_cart": ["userId", "itemId", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy"],
            "tbl_customer": ["contactPerson", "contactPersonNo", "accountId", "taxId", "isOnline", "companyId", "branchId", "websiteId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy"],
            "tbl_customer_addr": ["customerId", "countryId", "stateId", "cityId", "emailId", "whatsappNo", "companyId", "branchId", "isShippingDefault", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy"],
            "tbl_onlinesales_items": ["onlineSalesId", "itemId", "itemName", "itemCode", "rate", "mrp", "qty", "freeQty", "discountPer", "discountAmt", "taxPer", "taxName", "taxAmt", "itemTotal", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy"],
            "tbl_coupons": ["couponName", "couponCode", "couponPer", "companyId", "branchId", "websiteId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy"],
            "tbl_online_sales": ["grandAmt", "companyId", "branchId", "websiteId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy"],
            "tbl_company": ["branchLimit", "userLimit", "shortName", "fyStart", "appDateFormat", "appColorCode", "emailId", "mobileNo", "whatsappNo", "isActive", "createdDt", "updatedDt", "createdBy", "updatedBy", "countryId", "stateId", "cityId"],
            "tbl_branch": ["companyId", "shortName", "fyStart", "appDateFormat", "appColorCode", "emailId", "mobileNo", "whatsappNo", "isActive", "createdDt", "updatedDt", "createdBy", "updatedBy", "countryId", "stateId", "cityId"],
            "tbl_pricelist": ["listName", "listDesc", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy"],
            "tbl_pricelist_items": ["pricelistId", "itemId", "purchaseRate", "purchaseRateInc", "sellingPrice", "customerSp", "shownValues", "shownValueDisc", "salesCost", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy"],
            "tbl_serialno": ["tableName", "prefixNo", "nextNo", "sequenceNo", "suffixNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy"],
            "tbl_country": ["isActive", "createdBy", "createdDt", "updatedDt"],
            "tbl_state": ["countryId", "isActive", "createdBy", "createdDt", "updatedDt"],
            "tbl_city": ["stateId", "isActive", "createdBy", "createdDt", "updatedDt"],
            "tbl_websitelist": ["websiteName", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy"],
            "tbl_users": ["userName", "fullName", "emailId", "mobileNo", "roleId", "onlineCustomerId", "isActive", "lastLogin", "companyId", "branchId", "passwordResetToken", "createdBy", "createdDt", "updatedDt", "updatedBy"],
            "tbl_role": ["companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy"]
        }

        for table, columns in schema_fix.items():
            for cam_col in columns:
                low_col = cam_col.lower()
                if low_col == cam_col: continue
                # Check if lowercase exists and camelcase doesn't
                cur.execute(f"SELECT count(*) FROM information_schema.columns WHERE table_name = '{table}' AND column_name = '{low_col}'")
                if cur.fetchone()[0] > 0:
                    cur.execute(f"SELECT count(*) FROM information_schema.columns WHERE table_name = '{table}' AND column_name = '{cam_col}'")
                    if cur.fetchone()[0] == 0:
                        print(f"Renaming {table}.{low_col} to {cam_col}")
                        cur.execute(f'ALTER TABLE {table} RENAME COLUMN {low_col} TO "{cam_col}";')

        conn.commit()
        print("Schema fix completed.")
        conn.close()
    except Exception as e:
        print(f"Failed: {e}")

if __name__ == "__main__":
    fix_schema()
