extends Control

var i=0
var j=0
var t=0

onready var scene_tree: SceneTree = get_tree()
onready var pause_overlay: ColorRect = $ColorRect

var paused: = false setget set_paused

var select_position_index = [0,0]
var sudoku_grid
var grid_origin
var check_result = 3

func _ready():
	PlayerData.connect("garam", self, "clear_grid")

func _unhandled_input(_event: InputEvent) -> void:
	if t==0:
		$ColorRect/grid_tiles.set_cell(j,i,9)
		++t

func result():
	grid_origin = [
		[  6,10,1,10,7,10,4,10,3],
		[  10,10,10,10,10,10,10,10,10],
		[  4,10,10,10,7,10,10,10,3],
		[  10,10,10,10,10,10,10,10,10],
		[  2,10,2,10,1,10,8,10,9],
		[  10,10,10,10,10,10,10,10,10],
		[  4,10,10,10,5,10,10,10,3],
		[  10,10,10,10,10,10,10,10,10],
		[  8,10,3,10,5,10,2,10,3]
	]
	
func clear_grid():
	self.paused = true
	sudoku_grid = [
		[  0,11,1,11,7,11,0,11,0],
		[  11,10,10,10,11,10,10,10,11],
		[  4,10,10,10,0,10,10,10,3],
		[  11,10,10,10,11,10,10,10,11],
		[  0,11,0,11,1,11,0,11,9],
		[  11,10,10,10,11,10,10,10,11],
		[  4,10,10,10,0,10,10,10,0],
		[  11,10,10,10,11,10,10,10,11],
		[  8,11,0,11,5,11,0,11,3]
	]
	# This is not needed on the first load of the program
	# But is needed more for when the user presses the reset button
	for y in range (0, sudoku_grid.size()):
		for x in range(0, sudoku_grid.size()):
			var number = sudoku_grid[y][x]
			if number !=10 && number !=11:
				$ColorRect/grid_tiles.set_cell(x, y, number - 1)
	$ColorRect/grid_tiles.set_cell(0, 0,9)


func _on_UP_pressed():
	var tile_1
	if i>0:
		i=i-1
	var tile_2
	tile_1 =$ColorRect/grid_tiles.get_cell(j,i+1)
	if  tile_1 == 9:
		$ColorRect/grid_tiles.set_cell(j,i+1,-1)
	if sudoku_grid[i][j]==0:
		tile_2 = 9
	elif sudoku_grid[i][j]!=0:
		tile_2 =$ColorRect/grid_tiles.get_cell(j,i)
	if i==8:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if i==7 && sudoku_grid[i][j]==10:
		i=4
		if sudoku_grid[i][j]==0:
			tile_2 = 9
		elif sudoku_grid[i][j]!=0:
			tile_2 =$ColorRect/grid_tiles.get_cell(j,i)
	elif i==7:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if i==6:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if i==5:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if i==4:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if i==3 && sudoku_grid[i][j]==10:
		i=0
		if sudoku_grid[i][j]==0:
			tile_2 = 9
		elif sudoku_grid[i][j]!=0:
			tile_2 =$ColorRect/grid_tiles.get_cell(j,i)
	elif i==3:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if i==2:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if i==1:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if i==0:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	


func _on_RIGHT_pressed():
	if j<8:
		j=j+1
	var tile_1
	var tile_2
	tile_1 =$ColorRect/grid_tiles.get_cell(j-1,i)
	if  tile_1 == 9:
		$ColorRect/grid_tiles.set_cell(j-1,i,-1)
	if sudoku_grid[i][j]==0:
		tile_2 = 9
	elif sudoku_grid[i][j]!=0:
		tile_2 =$ColorRect/grid_tiles.get_cell(j,i)
	if j==0:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if j==1 && sudoku_grid[i][j]==10:
		j=4
		if sudoku_grid[i][j]==0:
			tile_2 = 9
		elif sudoku_grid[i][j]!=0:
			tile_2 =$ColorRect/grid_tiles.get_cell(j,i)
	elif j==1:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if j==2:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if j==3:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if j==4:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if j==5 && sudoku_grid[i][j]==10:
		j=8
		if sudoku_grid[i][j]==0:
			tile_2 = 9
		elif sudoku_grid[i][j]!=0:
			tile_2 =$ColorRect/grid_tiles.get_cell(j,i)
	elif j==5:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if j==6:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if j==7:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if j==8:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	


func _on_LEFT_pressed():
	if j>0:
		j=j-1
	var tile_1
	var tile_2
	tile_1 =$ColorRect/grid_tiles.get_cell(j+1,i)
	if  tile_1 == 9:
		$ColorRect/grid_tiles.set_cell(j+1,i,-1)
	if sudoku_grid[i][j]==0:
		tile_2 = 9
	elif sudoku_grid[i][j]!=0:
		tile_2 =$ColorRect/grid_tiles.get_cell(j,i)
	if j==8:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if j==7 && sudoku_grid[i][j]==10:
		j=4
		if sudoku_grid[i][j]==0:
			tile_2 = 9
		elif sudoku_grid[i][j]!=0:
			tile_2 =$ColorRect/grid_tiles.get_cell(j,i)
	elif j==7:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if j==6:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if j==5:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if j==4:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if j==3 && sudoku_grid[i][j]==10:
		j=0
		if sudoku_grid[i][j]==0:
			tile_2 = 9
		elif sudoku_grid[i][j]!=0:
			tile_2 =$ColorRect/grid_tiles.get_cell(j,i)
	elif j==3:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if j==2:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if j==1:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if j==0:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j


func _on_DOWN_pressed():
	if i<8:
		i=i+1
	var tile_1
	var tile_2
	tile_1 =$ColorRect/grid_tiles.get_cell(j,i-1)
	if  tile_1 == 9:
		$ColorRect/grid_tiles.set_cell(j,i-1,-1)
	if sudoku_grid[i][j]==0:
		tile_2 = 9
	elif sudoku_grid[i][j]!=0:
		tile_2 =$ColorRect/grid_tiles.get_cell(j,i)
	if i==0:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if i==1 && sudoku_grid[i][j]==10:
		i=4
		if sudoku_grid[i][j]==0:
			tile_2 = 9
		elif sudoku_grid[i][j]!=0:
			tile_2 =$ColorRect/grid_tiles.get_cell(j,i)
	elif i==1:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if i==2:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if i==3:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if i==4:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if i==5 && sudoku_grid[i][j]==10:
		i=8
		if sudoku_grid[i][j]==0:
			tile_2 = 9
		elif sudoku_grid[i][j]!=0:
			tile_2 =$ColorRect/grid_tiles.get_cell(j,i)
	elif i==5:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if i==6:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if i==7:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	if i==8:
		$ColorRect/grid_tiles.set_cell(j,i,tile_2)
		select_position_index[0] = i
		select_position_index[1]=j
	
	
		
	
func _on_1_pressed():
	if sudoku_grid[select_position_index[0]][select_position_index[1]]==0:
		$ColorRect/grid_tiles.set_cell(select_position_index[1],select_position_index[0],0)
	sudoku_grid[select_position_index[0]][select_position_index[1]]=1


func _on_2_pressed():
	if sudoku_grid[select_position_index[0]][select_position_index[1]]==0:
		$ColorRect/grid_tiles.set_cell(select_position_index[1],select_position_index[0],1)
	sudoku_grid[select_position_index[0]][select_position_index[1]]=2

func _on_3_pressed():
	if sudoku_grid[select_position_index[0]][select_position_index[1]]==0:
		$ColorRect/grid_tiles.set_cell(select_position_index[1],select_position_index[0],2)
	sudoku_grid[select_position_index[0]][select_position_index[1]]=3



func _on_4_pressed():
	if sudoku_grid[select_position_index[0]][select_position_index[1]]==0:
		$ColorRect/grid_tiles.set_cell(select_position_index[1],select_position_index[0],3)
	sudoku_grid[select_position_index[0]][select_position_index[1]]=4


func _on_5_pressed():
	if sudoku_grid[select_position_index[0]][select_position_index[1]]==0:
		$ColorRect/grid_tiles.set_cell(select_position_index[1],select_position_index[0],4)
	sudoku_grid[select_position_index[0]][select_position_index[1]]=5


func _on_6_pressed():
	if sudoku_grid[select_position_index[0]][select_position_index[1]]==0:
		$ColorRect/grid_tiles.set_cell(select_position_index[1],select_position_index[0],5)
	sudoku_grid[select_position_index[0]][select_position_index[1]]=6


func _on_7_pressed():
	if sudoku_grid[select_position_index[0]][select_position_index[1]]==0:
		$ColorRect/grid_tiles.set_cell(select_position_index[1],select_position_index[0],6)
	sudoku_grid[select_position_index[0]][select_position_index[1]]=7


func _on_8_pressed():
	if sudoku_grid[select_position_index[0]][select_position_index[1]]==0:
		$ColorRect/grid_tiles.set_cell(select_position_index[1],select_position_index[0],7)
	sudoku_grid[select_position_index[0]][select_position_index[1]]=8

	
func _on_9_pressed():
	if sudoku_grid[select_position_index[0]][select_position_index[1]]==0:
		$ColorRect/grid_tiles.set_cell(select_position_index[1],select_position_index[0],8)
	sudoku_grid[select_position_index[0]][select_position_index[1]]=9



func _on_0_pressed():
	if sudoku_grid[select_position_index[0]][select_position_index[1]]!=0:
		$ColorRect/grid_tiles.set_cell(select_position_index[1],select_position_index[0],9)
	sudoku_grid[select_position_index[0]][select_position_index[1]]=0


func set_paused(value: bool) -> void:
	paused = value
	scene_tree.paused = value
	pause_overlay.visible = value

func _on_SOLVE_pressed():
	get_tree().paused= false
	self.paused = false
