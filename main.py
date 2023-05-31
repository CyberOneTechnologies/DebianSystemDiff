import os
import datetime
from tabulate import tabulate
from colorama import Fore, Style

# Function to catalog all files and folders recursively
def catalog_files(path):
    catalog = []
    for root, dirs, files in os.walk(path):
        for file in files:
            file_path = os.path.join(root, file)
            file_size = os.path.getsize(file_path)
            file_owner = os.stat(file_path).st_uid
            catalog.append((file_path, file_size, file_owner))
    return catalog

# Function to compare catalogs and generate the report
def generate_report(previous_catalog, current_catalog):
    report = []
    for file_path, file_size, file_owner in current_catalog:
        if (file_path, file_size, file_owner) not in previous_catalog:
            report.append((file_path, file_size, file_owner, "Added"))
    for file_path, file_size, file_owner in previous_catalog:
        if (file_path, file_size, file_owner) not in current_catalog:
            report.append((file_path, file_size, file_owner, "Removed"))
    return report

# Function to save the report to a file
def save_report(report):
    timestamp = datetime.datetime.now().strftime("%Y%m%d%H%M%S")
    report_path = f"/var/log/DebianSystemDiff/operatingsysdiff_{timestamp}.log"
    with open(report_path, "w") as file:
        file.write(tabulate(report, headers=["File Path", "File Size", "File Owner", "Status"]))

# Main function
def main():
    previous_catalog = catalog_files("/")
    current_catalog = catalog_files("/")
    report = generate_report(previous_catalog, current_catalog)
    save_report(report)
    print(f"{Fore.GREEN}{Style.BRIGHT}Report generated successfully!{Style.RESET_ALL}")

if __name__ == "__main__":
    main()
