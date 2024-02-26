# Blood-Bank-Database-Application
👩‍⚕️ 🩸 This repository contains a comprehensive blood bank and donor database application coded in PHP and MySQL. It efficiently manages donor information, blood compatibility testing, recipient details, clinic data, and medical records for streamlined blood donation and transfusion management. 🩸 👩‍⚕️


Blood banks play a crucial role in healthcare systems by collecting, storing, and distributing blood and blood products. This database application aims to manage donor information, recipient information, blood types, compatibility tests, medical records, and other relevant data to facilitate the functioning of a blood bank.

### Features:
* Donor Management: Capture and store detailed information about blood donors, including personal details, contact information, medical history, and donation records.
* Blood Compatibility Testing: Perform compatibility testing between donors and recipients to ensure safe blood transfusions.
* Recipient Management: Manage recipient information, including personal details, contact information, medical history, and organ transplantation records.
* Clinic Management: Store information about clinics involved in blood donation and transplantation, including clinic names, locations, directors, and managers.
* Medical Records: Maintain comprehensive medical records for both donors and recipients, including illness history, test results, and treatment details.
* Insurance Management: Track insurance details for recipients, including insurance types, coverage periods, and coverage amounts.

### Database Schema

![ERD](https://github.com/laura-gabriela27/Blood-Bank-Database-Application/assets/147931608/e47e4750-44e0-436a-a5cf-bb9855fef476)

The database schema includes the following tables:

* antigen: Stores information about antigens.
* blood_type: Contains data related to different blood types, including plasma level and associated antigen.
* clinic: Stores details of clinics, including location and personnel information.
* compatibility: Manages compatibility test results between donors and recipients.
* country: Contains information about countries.
* doctor: Stores information about doctors, including their specialization and contact details.
* donor: Manages donor information such as name, age, gender, and contact details.
* donor_add_info: Contains additional information about donors, including birth date, blood type, and medical history.
* donor_card: Stores information about donor cards and donation details.
* donor_organ: Manages information about donated organs by donors.
* do_medical_record: Contains medical records of donors.
* insurance: Stores insurance information for donors and recipients.
* location: Manages location data such as address and postal code.
* organ_type: Contains information about organ types, including tissue type and function.
* recipient: Stores recipient information similar to donor information.
* recipient_card: Manages recipient card details and organ information.
* re_add_info: Contains additional information about recipients.
* re_medical_record: Contains medical records of recipients.
* rh: Stores data related to Rh blood group system.
* specialization: Manages doctor specialization information.
  
Tables
Each table includes its structure and sample data in the SQL code provided.
