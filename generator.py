# I'll fix the code structure another time because this project consumed me lol

def is_winner(board, player):
    win_conditions = [
        (0, 1, 2), (3, 4, 5), (6, 7, 8),
        (0, 3, 6), (1, 4, 7), (2, 5, 8),
        (0, 4, 8), (2, 4, 6)
    ]
    for condition in win_conditions:
        if board[condition[0]] == player and board[condition[1]] == player and board[condition[2]] == player:
            return True
    return False


def is_draw(board):
    return all(cell != '0' for cell in board)


def is_game_over(board):
    return is_winner(board, '1') or is_winner(board, '2') or is_draw(board)


def generate_next_positions(board, current_player):
    next_positions = []
    for i in range(len(board)):
        if board[i] == '0':
            new_board = board[:i] + current_player + board[i+1:]
            next_positions.append(new_board)
    return next_positions


def main():
    positions = {}
    board_dict = {}
    id_counter = 0

    initial_board = '0' * 9
    queue = [(initial_board, '1')]
    positions[initial_board] = {"id": id_counter, "next": []}
    board_dict[initial_board] = id_counter
    id_counter += 1

    while queue:
        current_board, current_player = queue.pop(0)
        next_player = '2' if current_player == '1' else '1'

        if is_game_over(current_board):
            continue

        next_positions = generate_next_positions(current_board, current_player)
        for next_board in next_positions:
            if next_board not in board_dict:
                positions[next_board] = {"id": id_counter, "next": []}
                board_dict[next_board] = id_counter
                id_counter += 1
                queue.append((next_board, next_player))
            positions[current_board]["next"].append(next_board)

    with open('output.txt', 'w') as file:
        for board, info in positions.items():
            board_with_commas = ','.join(board)
            next_ids = [board_dict[next_board] for next_board in info['next']]
            next_ids_list = []
            counter_id = 0
            for i in range(0, 9):
                if board[i] == '0':
                    if counter_id == len(next_ids):
                        next_ids_list.append(0)
                    else:
                        next_ids_list.append(next_ids[counter_id])
                        counter_id += 1
                else:
                    next_ids_list.append(0)

            next_ids_with_commas = ','.join(map(str, next_ids_list))
            if int(info['id']) % 100 == 0:
                if info['id'] != 0:
                    file.write("End Sub\n")
                file.write(f"Sub Sub{info['id']}()\n")
            file.write(
                f"  CreateBoard {board_with_commas},{next_ids_with_commas}\n")

        file.write("End Sub\n")
        file.write("\nSub Main()\n")
        for i in range(54, -1, -1):
            file.write(f"   Sub{i*100}\n")
        file.write(
            "End Sub\n"
        )


if __name__ == "__main__":
    # when i wrote this code only god and i knew what i was doing
    # now only god knows
    # i love adding this to python scripts lol
    main()
