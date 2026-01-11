// racine du framework Solide
package main

// importation des paquets
import (
	"os"
	"fmt"

	"github.com/dotapok/solide/internal/cli"
)

var (
	version = "dev"
	buildtime = "unknown"
)

// lancement du noyau
func main() {
	cmd := cli.NewCommand(version, buildtime)
	
	if err := cmd.Execute(); err != nil {
		fmt.Println(os.Stderr, err, "Erreur lors de l'exécution de la commande", err)
		os.Exit(1)
	}
}
