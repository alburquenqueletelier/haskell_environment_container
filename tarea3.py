class nodo:
    def __init__(self, data, coordenadas, camino):
        self.energia = data
        self.coordenadas = coordenadas
        self.camino = camino



def pasos_posibles(matrix, nodo):
    x = nodo.coordenadas[0]
    y = nodo.coordenadas[1]


    caminos_posibles = []



def paso_valido(matrix, x, y, paso_x, paso_y, explorados):
    limite_x = len(matrix) - 1
    limite_y = len(matrix[0]) - 1
    if paso_x > 0 and paso_x < limite_x and paso_y > 0 and paso_y < limite_y:
        if (paso_x,paso_y) not in explorados:
            return True 
    else:
        return False

    return
    

def resolver(matrix, nodo):
    if nodo.coordenadas == ((len(matrix - 1)),(len(matrix[0]-1))):
        return nodo
    elif nodo.energia < 0:
        return None
    
    pasos_posibles = pasos_posibles(matrix, nodo)
    return resolver(matrix, nodo)
    
def main():
    matrix = [
        [ 2, -3, 1, 0, 2, 3],
        [-5, 4, -2, 1, 0, -4],
        [ 1, 3, 0, -3, 2, 2],
        [ 2, -1, 4, 0, -5, 1],
        [ 0, 2, -3, 3, 4, -1],
        [ 1, 0, 2, -2, 1, 5]
    ]
    energia = 12
        
    nodo = nodo(energia, (0,0), [])
    resolver(matrix, nodo)


if __name__ == "__main__":
    main()