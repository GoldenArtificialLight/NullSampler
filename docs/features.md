# ⚙️ Funcionalidades

E suas respectivas regras

Legenda:
- <span style="color: rgb(200,0,0);">AD</span>: A definir

Terminologia:
- **Som**: Se refere a qualquer áudio carregado na memória do aplicativo. Um som pode ser carregado tanto ao adicionar um arquivo de áudio do telefone quanto ao gravar como microfone
- **Telha**: Botões especiais aos quais os sons são vinculados. Ao tocar numa delas, o som vinculado é reproduzido
- **Grade**: O conjunto de telhas na tela principal do aplicativo. Atualmente, a grade é 3x3
- **Barra/Loop**: Uma sequência de sons com uma determinada duração que pode ser repetitida várias vezes
- **Step**: Uma subdivisão do loop na qual um som pode ser "posicionado". Ao reproduzir o loop, o sistema lê step por step de acordo com a velocidade definida pelo BPM e reproduz os sons posicionados neles. É como uma drum machine
- **BPM**: Batidas por minuto

<!--
    Os spans são utilizados para adicionar cor ao texto.
    Eles não aparecem no github, mas aparecem no VSCode
    
    🔸
    ❌
    ✅
-->

---

## Sumário

> PRIORITÁRIO

1. ❌ <a href="#adicionar-arquivo-de-áudio">Adicionar arquivo de áudio</a>
2. ❌ <a href="#gravar-áudio">Gravar áudio</a>
3. ❌ <a href="#vincular-som-a-uma-telha">Vincular som a uma telha</a>
4. ❌ <a href="#remover-som">Remover som</a>
5. ❌ <a href="#substituir-som">Substituir som</a>
6. ❌ <a href="#reproduzir-som">Reproduzir som</a>
7. ❌ <a href="#salvar-grade-atual">Salvar grade atual</a>
8. ❌ <a href="#carregar-grade-de-arquivo">Carregar grade de arquivo</a>

> POSTERIORMENTE

9. 🔸 <a href="#adicionar-som-ao-step">Adicionar som ao step</a>
10. 🔸 <a href="#remover-som-do-step">Remover som do step</a>
11. 🔸 <a href="#reproduzir-loop">Reproduzir loop</a>
12. 🔸 <a href="#interromper-loop">Interromper loop</a>
13. 🔸 <a href="#alterar-bpm">Alterar BPM</a>


---


### **Adicionar arquivo de áudio**

**Descrição**: O usuário poderá enviar um arquivo de áudio para o aplicativo

Formatos prioritários:
- WAV
- MP3

Formatos previstos:
- OGG/OGA
- FLAC
- M4A

**Regras**:
- Tamanho máximo de arquivo: 50MB
- Duração máxima de arquivo: Duração em segundos do loop
- Todo áudio adicionado precisa estar vinculado a uma telha selecionada pelo usuário


---


### **Gravar áudio**

**Descrição**: O usuário poderá gravar um som com seu microfone e adicioná-lo ao aplicativo

**Regras**:
- A gravação não deve ter mais do que a duração em segundos do loop
- Todo áudio gravado deve ser vinculado a uma telha selecionada pelo usuário


---


### **Vincular som a uma telha**

**Descrição**: O sistema deve vincular automaticamente um som carregado à telha selecionada pelo usuário

**Regras**:
- Cada telha não pode ter mais que 1 som vinculado


---


### **Remover som**

**Descrição**: O usuário deve poder remover um som carregado no aplicativo

**Regras**:
- N/A


---


### **Substituir som**

**Descrição**: O usuário deve poder substituir um som carregado por outro, seja este um arquivo ou uma gravação

Nota: Na prática, é só um atalho para remover um som e adicionar outro, mas mais conveniente

**Regras**:
 - N/A


 ---


### **Reproduzir som**

**Descrição**: O aplicativo deve ser capaz de reproduzir os sons carregados nele, seja por arquivo de áudio ou gravação

**Regras**:
- Cada som deve ter um limite de polifonia de 2 vozes


---


### **Salvar grade atual**

**Descrição**: O usuário poderá salvar a grade atual com as telhas e seus respectivos sons no armazenamento persistente

**Regras**:
- Grades cujas telhas não tem sons vinculados não podem ser salvas


---


### **Carregar grade de arquivo**

**Descrição**: O usuário poderá recuperar uma grade salva e carregar seus sons para as telhas

**Regras**:
- Telhas não utilizadas pela grade permanecerão como estavam antes do carregamento


---


### **Adicionar som ao step**

**Descrição**: O usuário poderá adicionar/posicionar um som no step selecionado

**Regras**:
- N/A


---


### **Remover som do step**

**Descrição**: O usuário poderá remover um som do step selecionado

**Regras**:
- N/A


---


### **Reproduzir loop**

**Descrição**: O sistema poderá reproduzir os sons em cada step em sequência, seguindo a velocidade determinada pelo BPM

**Regras**:
- A reprodução sempre deve começar do primeiro step


---


### **Interromper loop**

**Descrição**: O usuário poderá interromper a reprodução do loop

**Regras**:
- O loop só pode ser interrompido se estiver sendo reproduzido
- Todos os sons devem ser interrompidos quando o loop parar


---


### **Alterar BPM**

**Descrição**: O usuário poderá alterar o BPM que controla a velocidade da reprodução do loop

**Regras**:
- Valor mínimo: 30
- Valor máximo: 300