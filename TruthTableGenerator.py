import itertools
def generate_truth_table(n):
    variables = [f"x{i}" for i in range(1, n + 1)]
    truth_table = []
    for combination in itertools.product([False, True], repeat=n):
        truth_table.append(dict(zip(variables, combination)))
    return truth_table

def display(truth_table):
    headers = list(truth_table[0].keys())
    print(" | ".join(headers))
    print("-" * (len(headers) * 4 - 3))
    for row in truth_table:
        values = [str(int(row[var])) for var in headers]
        print(" | ".join(values))

def calculate(row):
    return ((row['x3'] and not (row['x1'] ^ row['x2'])) or (not row['x1'] and row['x2'] and not row['x3']) or (row['x3'] and row['x4'] and (row['x1'] ^ row['x2'])))


if __name__ == "__main__":
    num_variables = 4
    table = generate_truth_table(num_variables)
    output = [calculate(row) for row in table]
    display(table)
    print("Output:")
    print(output)



