from django.shortcuts import render
from .models import Doctor, Nurse, Patient, Room, Appointment, Admission, NurseAssignment
# hospital/views.py

from django.shortcuts import render, redirect
from .forms import PatientRegistrationForm, DoctorRegistrationForm

def patient_registration(request):
    if request.method == 'POST':
        form = PatientRegistrationForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('index')  # Redirect to homepage after successful registration
    else:
        form = PatientRegistrationForm()
    return render(request, 'hospital/patient_registration.html', {'form': form})

def doctor_registration(request):
    if request.method == 'POST':
        form = DoctorRegistrationForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('index')  # Redirect to homepage after successful registration
    else:
        form = DoctorRegistrationForm()
    return render(request, 'hospital/doctor_registration.html', {'form': form})

# hospital/views.py


def doctor_list(request):
    doctors = Doctor.objects.all()
    return render(request, 'hospital/doctor_list.html', {'doctors': doctors})

def nurse_list(request):
    nurses = Nurse.objects.all()
    return render(request, 'hospital/nurse_list.html', {'nurses': nurses})

def patient_list(request):
    patients = Patient.objects.all()
    return render(request, 'hospital/patient_list.html', {'patients': patients})

def room_list(request):
    rooms = Room.objects.all()
    return render(request, 'hospital/room_list.html', {'rooms': rooms})

def appointment_list(request):
    appointments = Appointment.objects.all()
    return render(request, 'hospital/appointment_list.html', {'appointments': appointments})

def admission_list(request):
    admissions = Admission.objects.all()
    return render(request, 'hospital/admission_list.html', {'admissions': admissions})

def nurse_assignment_list(request):
    nurse_assignments = NurseAssignment.objects.all()
    return render(request, 'hospital/nurse_assignment_list.html', {'nurse_assignments': nurse_assignments})



def index(request):
    return render(request, 'index.html')

# Define other views for nurses, rooms, admissions, etc.
