import os
import django

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'config.settings.development')
django.setup()

from apps.crackers.models import Country, State, City
from django.conf import settings

def seed_india_data():
    print("--- Seeding India Location Data ---")
    
    # 1. Create/Get Country: India
    country, created = Country.objects.get_or_create(
        name='India',
        defaults={
            'code': 'IN',
            'is_active': True,
            'created_by': settings.ADMIN_USER_ID
        }
    )
    if created:
        print(f"Created Country: {country.name} (ID: {country.id})")
    else:
        print(f"Country '{country.name}' already exists (ID: {country.id})")

    # ... (location_data dictionary)

    # Data for States and Cities
    location_data = {
        "Andhra Pradesh": ["Visakhapatnam", "Vijayawada", "Guntur", "Nellore", "Kurnool"],
        "Arunachal Pradesh": ["Itanagar", "Tawang", "Ziro"],
        "Assam": ["Guwahati", "Silchar", "Dibrugarh", "Jorhat"],
        "Bihar": ["Patna", "Gaya", "Bhagalpur", "Muzaffarpur"],
        "Chhattisgarh": ["Raipur", "Bhilai", "Bilaspur", "Korba"],
        "Goa": ["Panaji", "Margao", "Vasco da Gama"],
        "Gujarat": ["Ahmedabad", "Surat", "Vadodara", "Rajkot", "Gandhinagar"],
        "Haryana": ["Faridabad", "Gurgaon", "Panipat", "Ambala"],
        "Himachal Pradesh": ["Shimla", "Dharamshala", "Solan"],
        "Jharkhand": ["Ranchi", "Jamshedpur", "Dhanbad", "Bokaro"],
        "Karnataka": ["Bangalore", "Mysore", "Hubli", "Mangalore", "Belgaum"],
        "Kerala": ["Thiruvananthapuram", "Kochi", "Kozhikode", "Thrissur"],
        "Madhya Pradesh": ["Bhopal", "Indore", "Gwalior", "Jabalpur", "Ujjain"],
        "Maharashtra": ["Mumbai", "Pune", "Nagpur", "Thane", "Nashik", "Aurangabad"],
        "Manipur": ["Imphal"],
        "Meghalaya": ["Shillong"],
        "Mizoram": ["Aizawl"],
        "Nagaland": ["Kohima", "Dimapur"],
        "Odisha": ["Bhubaneswar", "Cuttack", "Rourkela", "Berhampur"],
        "Punjab": ["Ludhiana", "Amritsar", "Jalandhar", "Patiala", "Bathinda"],
        "Rajasthan": ["Jaipur", "Jodhpur", "Udaipur", "Kota", "Ajmer"],
        "Sikkim": ["Gangtok"],
        "Tamil Nadu": ["Chennai", "Coimbatore", "Madurai", "Trichy", "Salem", "Tiruppur", "Erode"],
        "Telangana": ["Hyderabad", "Warangal", "Nizamabad", "Karimnagar"],
        "Tripura": ["Agartala"],
        "Uttar Pradesh": ["Lucknow", "Kanpur", "Agra", "Varanasi", "Meerut", "Prayagraj", "Ghaziabad"],
        "Uttarakhand": ["Dehradun", "Haridwar", "Roorkee", "Haldwani"],
        "West Bengal": ["Kolkata", "Howrah", "Darjeeling", "Siliguri", "Asansol"],
        "Delhi": ["New Delhi", "North Delhi", "South Delhi"],
        "Chandigarh": ["Chandigarh"],
        "Puducherry": ["Puducherry", "Karaikal", "Mahe"],
        "Jammu and Kashmir": ["Srinagar", "Jammu"],
        "Ladakh": ["Leh", "Kargil"],
        "Andaman and Nicobar Islands": ["Port Blair"],
        "Lakshadweep": ["Kavaratti"],
        "Dadra and Nagar Haveli and Daman and Diu": ["Daman", "Silvassa"]
    }

    for state_name, cities in location_data.items():
        # 2. Create/Get State
        state, s_created = State.objects.get_or_create(
            name=state_name,
            country=country,
            defaults={
                'is_active': True,
                'created_by': settings.ADMIN_USER_ID
            }
        )
        if s_created:
            print(f"  Created State: {state.name}")
        
        # 3. Create Cities
        for city_name in cities:
            city, c_created = City.objects.get_or_create(
                name=city_name,
                state=state,
                defaults={
                    'is_active': True,
                    'created_by': settings.ADMIN_USER_ID
                }
            )
            if c_created:
                # print(f"    Created City: {city.name}")
                pass

    print("\n--- Seeding Complete ---")

if __name__ == "__main__":
    seed_india_data()
