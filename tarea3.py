class nodo:
    def __init__(self, data, coordenadas, camino):
        self.energia = data
        self.coordenadas = coordenadas
        self.camino = camino
          
    
    

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

def caminos(matrix, coordenada):
    caminos = []
    

def resolver(matrix, nodo):
    if nodo.coordenadas == ((len(matrix - 1)),(len(matrix[0]-1))):
        return nodo
    elif nodo.energia < 0:
        return None
    
    caminos = caminos(matrix, nodo.coordenada)
    return resolver(matrix, nodo)
    

if __name__ == "__main__":
    main()