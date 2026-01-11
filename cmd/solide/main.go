// racine du framework Solide
package main

// importation des paquets
import (
	"os"
	"fmt"

	"solide/framework/internal/cli"
)

var (
	version = "dev"
	buildtime = "unknown"
)

// lancement du noyau
func main() {
	cmd := cli.PresentationCmd(version, buildtime)
	cmd.AddCommands()
	
	if err := cmd.Execution(); err != nil {
		fmt.Println(os.Stderr, err, "Erreur lors de l'exécution de la commande", err)
		os.Exit(1)
	}
}
