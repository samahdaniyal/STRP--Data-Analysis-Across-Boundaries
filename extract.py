import pandas as pd

def filter_csv_by_series(input_csv, output_csv, column_name, series_value):
    try:
        # Try reading the CSV file with 'utf-8' encoding
        df = pd.read_csv(input_csv, encoding='utf-8')
    except UnicodeDecodeError:
        # If it fails, try reading with 'ISO-8859-1' encoding
        df = pd.read_csv(input_csv, encoding='ISO-8859-1')
    
    filtered_df = df[df[column_name] == series_value]
    filtered_df.to_csv(output_csv, index=False)

# Usage example
input_csv = r'C:\Users\samah\Downloads\sesric_data (14).csv'  # Replace with your input CSV file path
output_csv = r'Agriculture Share of Government Expenditure.csv'  # Replace with your desired output CSV file path
column_name = 'Indicator'  # Replace with the column name to filter by
series_value = 'SDG02.0a.01AgricultureShareofGovernmentExpenditure'  # Replace with the series value to filter by

filter_csv_by_series(input_csv, output_csv, column_name, series_value)

# def delete_rows_by_series(input_csv, output_csv, column_name, series_value):
#     try:
#         # Try reading the CSV file with 'utf-8' encoding
#         df = pd.read_csv(input_csv, encoding='utf-8')
#     except UnicodeDecodeError:
#         # If it fails, try reading with 'ISO-8859-1' encoding
#         df = pd.read_csv(input_csv, encoding='ISO-8859-1')
    
#     # Filter out the rows where the column matches the series_value
#     filtered_df = df[df[column_name] != series_value]
    
#     # Save the remaining rows to the output CSV file
#     filtered_df.to_csv(output_csv, index=False)

# # Parameters for the function
# input_csv = r'climate and development.csv'
# output_csv = r'climate and development.csv'
# column_name = 'Series Name'
# series_value = 'Gini index (World Bank estimate)'

# # Call the function
# delete_rows_by_series(input_csv, output_csv, column_name, series_value)
