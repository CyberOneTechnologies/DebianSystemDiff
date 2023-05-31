# DebianSystemDiff

DebianSystemDiff is a Python program that catalogs and tracks changes in files and folders on a Debian-based system. It generates a daily report comparing the current day's file system state with the previous day's state.

## Installation

1. Clone this repository to your Debian-based system:
```
git clone https://github.com/CyberOneTechnologies/DebianSystemDiff.git
```

2. Navigate to the project directory:
```
cd DebianSystemDiff
```

3. Run the setup script to install dependencies, set permissions, and schedule the daily comparison:
```
sudo bash setup.sh
```

4. The program will now run automatically every day at 1:30 AM, comparing the current day's file system with the previous day's. The report will be saved in the `/var/log/DebianSystemDiff/` directory.

## Dependencies
- Python 3
- colorama
- psutil
- tabulate

Install the dependencies using pip:
```
pip install -r requirements.txt
```

## Usage
No additional user intervention is required after the setup. The program will automatically run daily and generate the comparison report.

To manually run the comparison and generate the report, you can execute the main.py script:
```
python3 main.py
```

# Report Format
The generated report provides information about added or removed files and folders between the current day and the previous day's snapshots. The report includes the file path, file size, file owner, and status (added or removed).

# Contributing
Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

# License
This project is licensed under the MIT License.

Feel free to modify the content as needed for your specific project.
Once you have created the `README.md` file, commit and push it to your GitHub repository with an appropriate comment describing the changes made.
Let me know if you need further assistance or have any other questions!
