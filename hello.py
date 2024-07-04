import os
import json
import tkinter as tk
from tkinter import messagebox, simpledialog

class DailyLog:
    def __init__(self, date):
        self.date = date
        self.tasks = self.load_tasks()

    def add_task(self, description):
        self.tasks.append(description)
        print("Tarefa adicionada com sucesso!")
        self.save_tasks()

    def list_tasks(self):
        return self.tasks

    def delete_task(self, task_index):
        if 0 <= task_index < len(self.tasks):
            removed_task = self.tasks.pop(task_index)
            print(f"Tarefa '{removed_task}' removida com sucesso!")
            self.save_tasks()
        else:
            print("Índice de tarefa inválido.")

    def save_tasks(self):
        if os.path.exists("tasks.json"):
            with open("tasks.json", "r") as file:
                data = json.load(file)
        else:
            data = {}
        data[self.date] = self.tasks
        with open("tasks.json", "w") as file:
            json.dump(data, file)

    def load_tasks(self):
        if os.path.exists("tasks.json"):
            with open("tasks.json", "r") as file:
                data = json.load(file)
                return data.get(self.date, [])
        return []

class DailyLogApp:
    def __init__(self, root):
        self.root = root
        self.root.title("Bloco de Notas Pessoal")

        self.date_label = tk.Label(root, text="Insira a data (Dia-Mês-Ano):")
        self.date_label.pack()

        self.date_entry = tk.Entry(root)
        self.date_entry.pack()

        self.date_button = tk.Button(root, text="Confirmar Data", command=self.set_date)
        self.date_button.pack()

        self.tasks_listbox = tk.Listbox(root)
        self.tasks_listbox.pack()

        self.task_entry = tk.Entry(root)
        self.task_entry.pack()

        self.add_task_button = tk.Button(root, text="Adicionar Tarefa", command=self.add_task)
        self.add_task_button.pack()

        self.delete_task_button = tk.Button(root, text="Eliminar Tarefa", command=self.delete_task)
        self.delete_task_button.pack()

        self.quit_button = tk.Button(root, text="Sair", command=root.quit)
        self.quit_button.pack()

        self.daily_log = None

    def set_date(self):
        date = self.date_entry.get()
        self.daily_log = DailyLog(date)
        self.update_tasks_list()

    def add_task(self):
        description = self.task_entry.get()
        if self.daily_log:
            self.daily_log.add_task(description)
            self.update_tasks_list()
            self.task_entry.delete(0, tk.END)
        else:
            messagebox.showwarning("Data não definida", "Por favor, insira uma data primeiro.")

    def delete_task(self):
        selected_task_index = self.tasks_listbox.curselection()
        if self.daily_log and selected_task_index:
            task_index = selected_task_index[0]
            self.daily_log.delete_task(task_index)
            self.update_tasks_list()
        else:
            messagebox.showwarning("Tarefa não selecionada", "Por favor, selecione uma tarefa para eliminar.")

    def update_tasks_list(self):
        if self.daily_log:
            self.tasks_listbox.delete(0, tk.END)
            for task in self.daily_log.list_tasks():
                self.tasks_listbox.insert(tk.END, task)

if __name__ == "__main__":
    root = tk.Tk()
    app = DailyLogApp(root)
    root.mainloop()
