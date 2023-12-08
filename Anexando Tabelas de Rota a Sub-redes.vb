Anexando Tabelas de Rota a Sub-redes
A última peça, precisamos associar as sub-redes às suas respectivas tabelas de rotas. Os que chamamos de "públicos" precisam se conectar à tabela de rotas públicas e aos "particulares" à tabela de rotas particulares:

# Anexar as sub-redes públicas às tabelas de rotas públicas
 # e anexar as sub-redes privadas às tabelas de rotas privadas:     
  PublicSubnetARouteTableAssociation:
    Type: AWS::EC2::SubnetRouteTableAssociation
    Properties:
      SubnetId: !Ref PublicSubnetA
      RouteTableId: !Ref PublicRouteTable
  PublicSubnetBRouteTableAssociation:
    Type: AWS::EC2::SubnetRouteTableAssociation
    Properties:
      SubnetId: !Ref PublicSubnetB
      RouteTableId: !Ref PublicRouteTable
  PrivateSubnetARouteTableAssociation:
    Type: AWS::EC2::SubnetRouteTableAssociation
    Properties:
      SubnetId: !Ref PrivateSubnetA
      RouteTableId: !Ref PrivateRouteTable
  PrivateSubnetBRouteTableAssociation:
    Type: AWS::EC2::SubnetRouteTableAssociation
    Properties:
      SubnetId: !Ref PrivateSubnetB
      RouteTableId: !Ref PrivateRouteTable