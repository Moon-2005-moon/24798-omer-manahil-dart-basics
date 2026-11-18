// Student: Manahil Ishag Adam Omer
// Reg no: 24798
const String regNo = '24798';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// B2: Count vowels (case-insensitive)
int countVowels(String text) {
  // by M.I.A.O.
  String lower = text.toLowerCase();
  int count = 0;
  int i = 0;
  while (i < lower.length) {
    String ch = lower[i];
    if (ch == 'a' || ch == 'e' || ch == 'i' || ch == 'o' || ch == 'u') {
      count++;
    }
    i++;
  }
  return count;
}

// B3: Extract capitalized initials with dots
String initials(String fullName) {
  // by M.I.A.O.
  String trimmed = fullName.trim();
  if (trimmed.isEmpty) return '';

  List<String> parts = trimmed.split(RegExp(r'\s+'));
  String result = '';
  int i = 0;
  while (i < parts.length) {
    if (parts[i].isNotEmpty) {
      result += '${parts[i][0].toUpperCase()}.';
    }
    i++;
  }
  return result;
}

// C5: Right-aligned triangle (* for odd rows, # for even rows)
void drawTriangle(int height) {
  // by M.I.A.O.
  if (height <= 0) return;

  int row = 1;
  while (row <= height) {
    String spaces = ' ' * (height - row);
    String symbol = (row % 2 == 1) ? '*' : '#';
    String chars = symbol * row;
    print('$spaces$chars');
    row++;
  }
}

// D2.1: Fictional MoMo tariff
int momoFee(int amount) {
  // by M.I.A.O.
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

// D2.2: Mask phone number keeping first 3 and last 2 digits
String maskPhone(String phone) {
  // by M.I.A.O.
  if (phone.length != 10) return 'INVALID';
  String firstThree = phone.substring(0, 3);
  String lastTwo = phone.substring(phone.length - 2);
  return '$firstThree*****$lastTwo';
}

void main() {
  print('Reg no: $regNo | D=$d | T=$t');

  // B2 test
  String myName = 'Manahil Ishag Adam Omer';
  int vowelCount = countVowels(myName);
  print('$myName has $vowelCount vowels');

  // B3 tests
  print(initials(myName));
  print(initials('  ana   uwase  '));
  print(initials(''));

  // C5 tests
  drawTriangle(d + 3);
  drawTriangle(0);
  drawTriangle(-2);

  // D2: MoMo receipt printer (using while loop)
  int i = 1;
  int totalFees = 0;
  String phone = '0788123456';
  while (i <= d + 3) {
    int amount = i * 4000 + t * 100;
    int fee = momoFee(amount);
    totalFees += fee;
    print('Receipt $i $amount RWF | fee $fee RWF | to ${maskPhone(phone)}');
    i++;
  }
  print('Total fees: $totalFees RWF');
}