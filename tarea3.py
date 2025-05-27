class nodo:
    def __init__(self, data, coordenadas, nodoPrevio):
        self.energia = data
        self.coordenadas = coordenadas
        self.nodoPrevio = nodoPrevio    
    
    

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
    print(((len(matrix ) - 1),(len(matrix[0])-1)))
    
    #nodo = nodo(energia, [0,0], None)
    #resolver(matrix, nodo)
    
def resolver(matrix, nodo):
    if nodo.coordenadas == ((len(matrix - 1)),(len(matrix[0]-1))):
        return nodo
    
    return resolver(matrix, nodo)
    

if __name__ == "__main__":
    main()