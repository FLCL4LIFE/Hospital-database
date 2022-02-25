SELECT EmployeeLastName AS DoctorLastName, EmployeeFirstName AS DoctorFirstName, Specialty 
FROM Employee_T INNER JOIN Doctor_T ON Employee_T.EmployeeID = Doctor_T.EmployeeID
ORDER BY DoctorLastName, DoctorFirstName;

SELECT PatientLastName, PatientFirstName, AppointmentTime, VisitReason, 
ED.EmployeeLastName AS DoctorLastName, ED.EmployeeFirstName AS DoctorFirstName, Specialty,
ER.EmployeeLastName AS ReceptionistLastName, ER.EmployeeFirstName AS ReceptionistFirstName
FROM Patient_T 
INNER JOIN Appointment_T ON Patient_T.PatientID = Appointment_T.PatientID
INNER JOIN Employee_T ON Appointment_T.DoctorID = Employee_T.EmployeeID
INNER JOIN Doctor_T ON Employee_T.EmployeeID = Doctor_T.EmployeeID
INNER JOIN Employee_T ED ON ED.EmployeeID = Appointment_T.DoctorID
INNER JOIN Employee_T ER ON ER.EmployeeID = Appointment_T.ReceptionistID
ORDER BY PatientLastName, PatientFirstName, AppointmentTime ;

SELECT PatientLastName, PatientFirstName, TreatmentDate, TreatmentDescription, 
ED.EmployeeLastName AS DoctorLastName, ED.EmployeeFirstName AS DoctorFirstName,
EN.EmployeeLastName AS NurseLastName, EN.EmployeeFirstName AS NurseFirstName, Certification
FROM Patient_T 
INNER JOIN Treatment_T ON Patient_T.PatientID = Treatment_T.PatientID
INNER JOIN Employee_T ON Treatment_T.DoctorID = Employee_T.EmployeeID
INNER JOIN Doctor_T ON Employee_T.EmployeeID = Doctor_T.EmployeeID
INNER JOIN Employee_T ED ON ED.EmployeeID = Treatment_T.DoctorID
INNER JOIN Employee_T EN ON EN.EmployeeID = Treatment_T.NurseID
INNER JOIN Nurse_T ON Treatment_T.NurseID = Nurse_T.EmployeeID
ORDER BY PatientLastName, PatientFirstName, TreatmentDate;

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
