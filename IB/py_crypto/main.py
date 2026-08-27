from Crypto.Cipher import AES
from Crypto.Random import get_random_bytes
from Crypto.Util.Padding import pad, unpad
import base64

### Решил для примера сначала зашифровать текст, а потом уже подобрать к нему key
# Шифруем текст

text = "NetologyZubkov"
secret = '777'
secret_key = secret.encode('utf-8').ljust(16, b'\x00')[:16]

def encrypt(text, key):
    cipher = AES.new(key, AES.MODE_CBC)
    text_bytes = text.encode('utf-8')
    padded_text = pad(text_bytes, AES.block_size)
    ciphertext = cipher.encrypt(padded_text)
    encrypted = base64.b64encode(cipher.iv + ciphertext).decode('utf-8')
    print(encrypted)

encrypt(text, secret_key)



# Атака грубой силой
def brute_force_aes(encrypted_text, max_attempts=999):
    encrypted_data = base64.b64decode(encrypted_text)
    iv = encrypted_data[:16]
    ciphertext = encrypted_data[16:]
    
    print(f"Начинаем атаку грубой силой...")

    for i in range(max_attempts):
        # Формируем пароль (например, 000, 001, ..., 999)
        password = f"{i:03d}"  # 3-значное число с ведущими нулями
        
        key = password.encode('utf-8').ljust(16, b'\x00')[:16]
        
        try:
            # Пытаемся расшифровать
            cipher = AES.new(key, AES.MODE_CBC, iv)
            decrypted_data = cipher.decrypt(ciphertext)
            decrypted_padded = unpad(decrypted_data, AES.block_size)
            decrypted_text = decrypted_padded.decode('utf-8')
            
            print(f"\nУСПЕХ! Найден пароль: {password}")
            print(f"Расшифрованный текст: {decrypted_text}")
            return password, decrypted_text
            
        except Exception as e:
            # Если расшифровка не удалась - продолжаем перебор
            if i % 100 == 0:
                print(f"Попытка {i:03d}: {password} - неудача")
    
    print("Атака не удалась - пароль не найден")
    return None

enc_text = input(f'Введите зашифрованный текст: ') #Здесь необходимо скопировать и вставить наш зашифрованный текст

brute_force_aes(enc_text)
