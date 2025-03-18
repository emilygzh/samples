#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct teamInfo {
    char name[64];
    int numberOfPeople;
    int totalScore;
    int averageScore;
};

struct linkNode {
    struct teamInfo team;
    struct linkNode *next;
};

struct linkNode *createNode(const char *name, int numberOfPeople, int totalScore) {
    struct linkNode *newNode = (struct linkNode*)malloc(sizeof(struct linkNode));



    strcpy(newNode->team.name, name);
    newNode->team.numberOfPeople = numberOfPeople;
    newNode->team.totalScore = totalScore;
    newNode->team.averageScore = totalScore / numberOfPeople;
    newNode->next = NULL;
    return newNode;
}

void insertSort(struct linkNode **head, struct linkNode *newNode) {
    if (*head == NULL) {  
        newNode->next = *head;
        *head = newNode;
        return;
    }
    if (newNode->team.averageScore > (*head)->team.averageScore || 
        (newNode->team.averageScore == (*head)->team.averageScore && strcmp(newNode->team.name, (*head)->team.name) < 0)) {
        newNode->next = *head;
        *head = newNode;
        return;
    }




    struct linkNode *current = *head;
    while (current->next && 
          (current->next->team.averageScore > newNode->team.averageScore || 
          (current->next->team.averageScore == newNode->team.averageScore && strcmp(current->next->team.name, newNode->team.name) < 0))) {
        current = current->next;
    }

    newNode->next = current->next;
    current->next = newNode;
}


void freeLinkedList(struct linkNode *head) {
    while (head) {
        struct linkNode *temp = head;
        head = head->next;
        free(temp);
    }
}

void printFinal(struct linkNode *head) {
    while (head) {
        printf("%s %d\n", head->team.name, head->team.averageScore);
        head = head->next;
    }
}
int main(int argc, char *argv[]) {
    if (argc != 2) {
        return EXIT_FAILURE;
    }

    FILE *file = fopen(argv[1], "r");
    if (!file) {
        return EXIT_FAILURE;
    }

    struct linkNode *head = NULL;
    int totalPeople = 0;
    char name[64];
    int numberOfPeople, totalScore;

 while (fscanf(file, "%63s", name) == 1 && strcmp(name, "DONE") != 0) {
    fscanf(file, "%d\n%d\n", &numberOfPeople, &totalScore);
    totalPeople += numberOfPeople;
    struct linkNode *newNode = createNode(name, numberOfPeople, totalScore);
    insertSort(&head, newNode);
}


    printFinal(head); 
    printf("%d\n", totalPeople); 
    freeLinkedList(head);
    return EXIT_SUCCESS;
}
