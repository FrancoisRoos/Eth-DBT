import holidays


def is_holiday(date_col):
    # Chez Jaffle
    french_holidays = holidays.France()
    is_holiday = (date_col in french_holidays)
    return is_holiday

def model(dbt, session):

    dbt.config(packages= ["holidays"])
    my_sql_model_df = dbt.ref("stablecoin_activity")

    my_sql_model_df = my_sql_model_df.to_pandas()
    my_sql_model_df['is_holiday'] = my_sql_model_df['DATE'].apply(is_holiday)

    return my_sql_model_df