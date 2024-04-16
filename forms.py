# hospital/forms.py

from django import forms
# from .models import Patient,Doctor
from .models import Doctor, Nurse, Patient, Room, Appointment, Admission, NurseAssignment

class PatientRegistrationForm(forms.ModelForm):
    class Meta:
        model = Patient
        fields = ['first_name', 'last_name', 'date_of_birth', 'gender', 'phone_number', 'email']

class DoctorRegistrationForm(forms.ModelForm):
    class Meta:
        model = Doctor
        fields = ['first_name', 'last_name', 'specialty', 'phone_number', 'email']

        # hospital/forms.py

class DoctorForm(forms.ModelForm):
    class Meta:
        model = Doctor
        fields = ['first_name', 'last_name', 'specialty', 'phone_number', 'email']

class NurseForm(forms.ModelForm):
    class Meta:
        model = Nurse
        fields = ['first_name', 'last_name', 'phone_number', 'email']

class PatientForm(forms.ModelForm):
    class Meta:
        model = Patient
        fields = ['first_name', 'last_name', 'date_of_birth', 'gender', 'phone_number', 'email']

class RoomForm(forms.ModelForm):
    class Meta:
        model = Room
        fields = ['room_number', 'room_type', 'availability_status']

class AppointmentForm(forms.ModelForm):
    class Meta:
        model = Appointment
        fields = ['patient', 'doctor', 'appointment_datetime', 'notes']

class AdmissionForm(forms.ModelForm):
    class Meta:
        model = Admission
        fields = ['patient', 'admission_date', 'discharge_date', 'room']

class NurseAssignmentForm(forms.ModelForm):
    class Meta:
        model = NurseAssignment
        fields = ['nurse', 'patient']
