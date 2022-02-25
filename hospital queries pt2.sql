SELECT DISTINCT EmployeeLastName AS DoctorLastName, EmployeeFirstName AS DoctorFirstName, Specialty, PatientLastName, PatientFirstName
FROM Appointment_T INNER JOIN Doctor_T ON Doctor_T.EmployeeID = Appointment_T.DoctorID
INNER JOIN Employee_T ON Employee_T.EmployeeID = Doctor_T.EmployeeID
INNER JOIN Patient_T ON Patient_T.PatientID = Appointment_T.PatientID
ORDER BY DoctorLastName;

SELECT EmployeeLastName AS DoctorLastName, EmployeeFirstName AS DoctorFirstName, Specialty, COUNT(AppointmentID) AS '# of Appointments'
FROM Appointment_T INNER JOIN Doctor_T ON Doctor_T.EmployeeID = Appointment_T.DoctorID
INNER JOIN Employee_T ON Employee_T.EmployeeID = Doctor_T.EmployeeID
GROUP BY DoctorID, DoctorLastName, DoctorFirstName, Specialty
ORDER BY '# of Appointments'DESC;

SELECT EmployeeLastName AS DoctorLastName, EmployeeFirstName AS DoctorFirstName, Specialty, COUNT(DISTINCT PatientID) AS '# of Pateints with Appointments'
FROM Appointment_T 
INNER JOIN Doctor_T ON Doctor_T.EmployeeID = Appointment_T.DoctorID
INNER JOIN Employee_T ON Employee_T.EmployeeID = Doctor_T.EmployeeID
GROUP BY DoctorID, DoctorLastName, DoctorFirstName, Specialty
ORDER BY `# of Pateints with Appointments` DESC;

SELECT EmployeeLastName AS DoctorLastName, EmployeeFirstName AS DoctorFirstName, Specialty, COUNT(AppointmentID) AS 'Non-Surgeon Appointments'
FROM Appointment_T 
INNER JOIN Doctor_T ON Doctor_T.EmployeeID = Appointment_T.DoctorID
INNER JOIN Employee_T ON Employee_T.EmployeeID = Doctor_T.EmployeeID
GROUP BY DoctorID, DoctorLastName, DoctorFirstName, Specialty
HAVING NOT (Specialty) = 'Surgeon'
ORDER BY `Non-Surgeon Appointments`;


