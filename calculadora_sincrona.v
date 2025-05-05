module calculadora_sincrona(
    input [7:0] entrada,
    input [2:0] codigo,
    input clk,
    input rst,
    output reg [7:0] saida
);

reg [7:0] acumulador;
    
always @(posedge clk or posedge rst) begin
    if (rst) begin
        acumulador = 8'b0; // rsta o acumulador para 0
        saida = 8'b0; // rsta a saída para 0
    end
    else begin
        case (codigo)
            3'b000: begin // Apenas mostra a entrada
                saida = entrada; 
                acumulador = acumulador; // Mantém o acumulador
            end
            3'b001: begin // Soma
                acumulador = acumulador + entrada; // Atualiza o acumulador
                saida = 8'b0; // Mantém a saída zerada
            end
            3'b010: begin // Subtração
                acumulador = acumulador - entrada; // Atualiza o acumulador
                saida = 8'b0; // Mantém a saída zerada
            end
            3'b011: begin // Mostrar acumulador
                acumulador = acumulador; // Mantém o acumulador
                saida = acumulador; // Atualiza a saída com o acumulador
            end
        endcase
    end
end

endmodule