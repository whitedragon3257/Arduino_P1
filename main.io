/*
  By: Sr.White Dragon
  Projeto para fins educacionais, não garantindo o pleno funcional para que o(a) aluno(a) seja estimulado a estudar o codigo ao invés de apenas copia-lo
  Logica:
      Importacao da biblioteca LiquidCrystal.h
      definicao dos pinos do display (rs, en, d4, d5, d6, d7)

      criacao do objeto lcd()

      setup(){
          inicializacao do display com a definicao de 16 colunas x 2 linhas
          printagem da mensagem solicitando os numeros
      }
      iniciando o codigo
      loop(){
          leitura dos 3 digitos
          se cada um deles for igual aos digitos 3, 6 e 9
              imprimir parabens
          senao
              pedir para digitar novamente

          esperar 2000 milesimos de segundos (2 segundos)
          solicitar mais 3 digitos
      }
      lerdigito(){
          funcao para ler digito do teclado
      }
*/
// Imoportando biblioteca responsável pela manipulação do Cristal Liquido (LCD)
#include <LiquidCrystal.h>

// Aqui é configurado o display LCD (pinos de conexão)
const int rs = 12;
const int en = 11;
const int d4 = 5;
const int d5 = 4;
const int d6 = 3;
const int d7 = 2;

LiquidCrystal lcd(rs, en, d4, d5, d6, d7);

void setup() {
                     // Inicializa o display LCD
  lcd.begin(16, 2);  // 16 colunas x 2 linhas
  lcd.print("Digite 3 digitos:");
}

void loop() {
  // Lê os 3 dígitos digitados pelo usuário
  int digit1 = readDigit();     // Lê o primeiro dígito
  int digit2 = readDigit();     // Lê o segundo dígito
  int digit3 = readDigit();     // Lê o terceiro dígito

  // Verifica se os dígitos formam o número 369
  if (digit1 == 3 && digit2 == 6 && digit3 == 9) {
    lcd.clear();                    // Limpa o display
    lcd.print("Parabens!");         // Imprime uma mensagem
  } else {
    lcd.clear();                    // Limpa o display
    lcd.print("Tente novamente");   // Imprime uma mensagem
  }

  // Aguarda um pouco (2 segundos) antes de limpar o display
  delay(2000);       // delay(2000) é a demora de 2 segundos para que seja executada a proxima linha
  lcd.clear();
  lcd.print("Digite 3 digitos:");
}

// Função para ler um dígito do teclado
int readDigit() {
  while (true) {
    if (Serial.available() > 0) {      // Validacao se o valor da serial é maior que 0
      char input = Serial.read();
      if (isdigit(input)) {
        return input - '0';             // Converte char para int
      }
    }
  }
}
