from django.test import TestCase
from apps.crackers.services import OrderService
from apps.crackers.models import SerialNo, OnlineSales
import concurrent.futures

class OrderSequenceTestCase(TestCase):
    def test_generate_next_trans_no_sequential(self):
        """Test that sequential calls generate unique incrementing order numbers."""
        no1 = OrderService.generate_next_trans_no()
        no2 = OrderService.generate_next_trans_no()
        no3 = OrderService.generate_next_trans_no()
        
        self.assertNotEqual(no1, no2)
        self.assertNotEqual(no2, no3)
        self.assertNotEqual(no1, no3)
        
        seq1 = int(no1[-4:])
        seq2 = int(no2[-4:])
        seq3 = int(no3[-4:])
        
        self.assertEqual(seq2, seq1 + 1)
        self.assertEqual(seq3, seq2 + 1)

    def test_generate_next_trans_no_multithreaded(self):
        """Test concurrent generation across multiple threads ensures zero duplicates."""
        generated_numbers = []
        
        def worker():
            return OrderService.generate_next_trans_no()

        with concurrent.futures.ThreadPoolExecutor(max_workers=5) as executor:
            futures = [executor.submit(worker) for _ in range(10)]
            for future in concurrent.futures.as_completed(futures):
                generated_numbers.append(future.result())

        self.assertEqual(len(generated_numbers), 10)
        # Verify all generated order numbers are unique
        self.assertEqual(len(set(generated_numbers)), 10)
