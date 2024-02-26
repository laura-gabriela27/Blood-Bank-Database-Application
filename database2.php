<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

    <title>Database Info</title>
  </head>
  <body>
    <div class="container mt-5">
      <h1 class="mb-5">Blood Bank and Organ Donations</h1>
      <form action="" method="post">
        <div class="form-group">
          <label for="querySelect">Select Query:</label>
          <select class="form-control" id="querySelect" name="query">
            <option value="">-- Select Query --</option>
            <option value="0">Show all compatibility tests with a rate higher than 70%</option>
            <option value="1">Show all doctors who work in a certain country</option>
            <option value="2">Show all organs from each clinic</option>
            <option value="3">Show the sum of all insurances and number of recipients per clinic</option>
            <option value="4">Show all recipients who need a liver transplant</option>
            <option value="5">Show all recipients who have insurance</option>
            <option value="6">Show all organs donated by dead people </option>
            <option value="7">Show patiens who belong to the clinic "Militari"and are older than 40</option>
            <option value="8">Show all patients who have A type and RH positive  </option>
            <option value="9">Show which doctor has donors who have cancer</option>
            </select>
</div>
<button type="submit" class="btn btn-danger">Submit</button>

<a href="database.php" class="btn btn-secondary">Return to overview</a>
</form>
<?php
// Check if the form has been submitted
if (isset($_POST['query'])) {
$query = $_POST['query'];
// Connect to the database
$conn = mysqli_connect('localhost', 'root', '123456', 'proiectdb');
$queries = array(
    "SELECT a.test_id, d.name as DONOR_NAME, e.name as RECIPIENT_NAME, f.type as BLOOD_TYPE, g.organ as TRANSPLANT_ORGAN, a.hla_level as COMPATIBILITY_RATE
FROM COMPATIBILITY a JOIN DONOR_ADD_INFO b
ON a.di_id= b.di_id
JOIN DONOR d
ON d.donor_id=b.donor_id
JOIN RE_ADD_INFO c
ON a.rei_id= c.rei_id
JOIN RECIPIENT e
ON e.recipient_id=c.recipient_id
JOIN RECIPIENT_CARD g
ON g.recipient_id=e.recipient_id
JOIN BLOOD_TYPE f
ON f.bt_id=c.bt_id
WHERE 70 < cast(a.hla_level as int)
ORDER BY a.test_id;",
    "SELECT a.Doctor_ID, a.Name as Doctor_Name, b.Name as Specialization_Name, c.Name as Clinic_Name, e.Name as Country_Name
FROM DOCTOR a JOIN SPECIALIZATION b
ON a.Specialization_ID= b.Spec_ID
JOIN Clinic c
ON c.Clinic_ID=a.Clinic_ID
JOIN Location d
ON c.Location_ID= d.Loc_ID
JOIN Country e
ON e.Country_ID=d.Country_ID
WHERE e.Country_ID = 5
ORDER BY a.Name;",
    "SELECT a.Name as Clinic, g.Name as Organ
FROM Clinic a JOIN DOCTOR b
ON a.Clinic_ID= b.Clinic_ID
JOIN DONOR_ADD_INFO c
ON b.Doctor_ID=c.Doctor_ID
JOIN DONOR d
ON c.Donor_ID= d.Donor_ID
JOIN Donor_CARD e
ON e.Donor_ID=d.Donor_ID
JOIN Donor_ORGAN f
ON e.DO_ID=f.DO_ID
JOIN ORGAN_TYPE g
ON f.OT_ID=g.OT_ID
ORDER BY g.name;",
    "SELECT a.Name as Clinic_Name, COUNT(b.REI_ID) as Total_Patients, SUM(d.Sum) as Total_Insurance_Value 
FROM Clinic a JOIN  RE_ADD_INFO b
ON a.Clinic_ID = b.Clinic_ID
JOIN INSURANCE d
ON d.Insurance_ID = b.Insurance_ID

GROUP BY a.Name;",
    "SELECT c.recipient_id, c.name, l.illness, d.organ, d.details
FROM RE_MEDICAL_RECORD l JOIN RECIPIENT c
ON l.recipient_id = c.recipient_id
JOIN RECIPIENT_CARD d
ON d.recipient_id = c.recipient_id
WHERE d.Organ LIKE '%ver'
ORDER BY c.recipient_id;",
    "SELECT c.recipient_id, c.name , d.type, d.period
FROM RE_ADD_INFO l JOIN RECIPIENT c
ON (l.recipient_id = c.recipient_id)
JOIN INSURANCE d
ON d.insurance_id=l.insurance_id
WHERE d.period > 5
ORDER BY c.recipient_id;
    ",
    "SELECT c.donor_id, c.name, l.details, d.time, d.organ_size, d. availability
FROM DONOR c JOIN DONOR_CARD l
ON c.DONOR_ID= l.DONOR_ID
JOIN DONOR_ORGAN d
ON d.DO_ID=l.DO_ID
WHERE d.availability = 0
ORDER BY c.Donor_ID;
    ",
    "SELECT e.donor_id, e.name, d.birth_date, l.name, c.name
FROM CLINIC c JOIN DOCTOR l
ON c.Clinic_ID= l.Clinic_ID

JOIN DONOR_ADD_INFO d
ON d.Doctor_ID=l.Doctor_ID
JOIN DONOR e
ON d.Donor_ID=e.Donor_ID

WHERE e.age > 40
AND c.name LIKE 'Militari'
ORDER BY e.Donor_ID;
    ",
    "SELECT c.recipient_id PATIENT_ID, c.name, d.type BLOOD_TYPE, e.type RH, e.PROTEIN PROTEIN FROM RECIPIENT c JOIN RE_ADD_INFO l ON c.recipient_id = l.recipient_id

JOIN BLOOD_TYPE d
ON d.bt_id = l.bt_id
JOIN RH e
ON e.rh_id = l.rh_id
WHERE e.type = '+'
AND d.type LIKE 'B'

UNION ALL

SELECT f.donor_id PATIENT_ID, f.name, d.type BLOOD_TYPE, e.type RH, e.PROTEIN PROTEIN FROM DONOR f JOIN DONOR_ADD_INFO g ON f.donor_id = g.donor_id
JOIN BLOOD_TYPE d
ON d.bt_id = g.bt_id
JOIN RH e
ON e.rh_id = g.rh_id
WHERE e.type = '+'
AND d.type LIKE 'A'
ORDER BY PATIENT_ID;
    ",
    "SELECT a.name, a.doctor_id, b.name as CLINIC_NAME, c.name as SPECIALIZATION_NAME, e.name as PATIENT_NAME, e.CNP, e.age, d.birth_date

FROM DOCTOR a JOIN CLINIC b
ON a.Clinic_ID= b.Clinic_ID
JOIN SPECIALIZATION c
ON c.spec_id=a.specialization_id
JOIN DONOR_ADD_INFO d
ON d.doctor_id=a.doctor_id
JOIN DONOR e
ON e.donor_id=d.donor_id
JOIN DO_MEDICAL_RECORD f
ON f.donor_id=e.donor_id
WHERE f.cancer = 1;
");
     $result = mysqli_query($conn, $queries[$query]);
     if (mysqli_num_rows($result) > 0) {
       // Output the data
       echo '<h2 class="mt-5">Query Results</h2>';
       echo '<table class="table table-bordered">';
       echo '<thead>';
       echo '<tr>';
       while ($field = mysqli_fetch_field($result)) {
         echo '<th>' . $field->name . '</th>';
       }
       echo '</tr>';
       echo '</thead>';
       echo '<tbody>';
       while ($row = mysqli_fetch_assoc($result)) {
         echo '<tr>';
         foreach ($row as $value) {
           echo '<td>' . $value . '</td>';
         }
         echo '</tr>';
       }
       echo '</tbody>';
       echo '</table>';
     } else {
       echo '<p>No results found.</p>';
     }
     mysqli_close($conn);
   }
   ?>
 </div>
</body>
</html>