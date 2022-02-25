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

