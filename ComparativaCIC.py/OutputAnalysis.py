import numpy as np
import scipy.signal as signal
import matplotlib.pyplot as plt

# Función para convertir hex a entero con signo (16 bits)
def hex_to_signed(val, bits=16):
    if val >= 2**(bits - 1):
        val -= 2**bits
    return val

# Leer archivo
File_Ver = '../ComparativaCIC.sim/sim_1/behav/xsim/out_real_ver.txt'
File_Sim = '../ComparativaCIC.sim/sim_1/behav/xsim/out_real_sim.txt'

with open(File_Ver, 'r') as f:
    hex_data_s = f.readlines()

with open(File_Sim, 'r') as f:
    hex_data_v = f.readlines()

# Convert to signed integers, ignoring invalid lines
int_data_s = []
int_data_v = []
for line in hex_data_s:
    line = line.strip()
    try:
        # Attempt to convert to integer (base 16)
        int_data_s.append(hex_to_signed(int(line, 16)))
    except ValueError:
        print(f"Skipping invalid hex value: {line}")

for line in hex_data_v:
    line = line.strip()
    try:
        # Attempt to convert to integer (base 16)
        int_data_v.append(hex_to_signed(int(line, 16)))
    except ValueError:
        print(f"Skipping invalid hex value: {line}")


# Plot the valid data
import matplotlib.pyplot as plt

# Plot the first dataset with a specific color and label
factor_escala = 0.25  # Por ejemplo, duplicamos la amplitud
int_data_s_amp = [x * factor_escala for x in int_data_s]
plt.plot(int_data_s_amp, label='Simulink', color='blue')

# Plot the second dataset with a different color and label
plt.plot(int_data_v, label='Verilog', color='red')

# Add title and labels
plt.title('Comparativa de señales filtradas')
plt.xlabel('Tiempo')
plt.ylabel('Valor')

# Show legend
plt.legend()

# Display the plot
plt.show()


# Definir una función para calcular la FFT y la frecuencia
def calcular_fft(data, fs=1.0):
    # Convertir los datos a un array de numpy
    data_np = np.array(data)
    
    # Calcular la FFT
    fft_data = np.fft.fft(data_np)
    
    # Calcular las frecuencias correspondientes
    n = len(data_np)
    freqs = np.fft.fftfreq(n, d=1/fs)
    
    # Solo tomamos la parte positiva del espectro
    pos_freqs = freqs[:n//2]
    pos_fft = np.abs(fft_data)[:n//2]
    
    return pos_freqs, pos_fft

# Calcular la FFT para ambas señales
fs = 1  # Frecuencia de muestreo, ajusta si es necesario
freqs_s, fft_s = calcular_fft(int_data_s_amp, fs)
freqs_v, fft_v = calcular_fft(int_data_v, fs)

# Graficar la respuesta en frecuencia de ambas señales
plt.figure(figsize=(10, 6))

# Graficar la FFT de la señal de Simulink (en azul)
plt.plot(freqs_s, fft_s, label='Simulink (FFT)', color='blue')

# Graficar la FFT de la señal de Verilog (en rojo)
plt.plot(freqs_v, fft_v, label='Verilog (FFT)', color='red')

# Añadir título y etiquetas
plt.title('Comparativa de Respuesta en Frecuencia de Señales')
plt.xlabel('Frecuencia (Hz)')
plt.ylabel('Magnitud')

plt.xlim(0, 0.1)
# Mostrar la leyenda
plt.legend()

# Mostrar el gráfico
plt.grid(True)
plt.show()
